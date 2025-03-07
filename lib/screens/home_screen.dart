import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

import '../controllers/controllers_mixin.dart';
import '../extensions/extensions.dart';
import '../models/stamp_rally_metro_20_model.dart';
import '../models/station_model.dart';
import '../utilities/tile_provider.dart';
import 'components/stamp_display_alert.dart';
import 'parts/stamp_rally_dialog.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> with ControllersMixin<HomeScreen> {
  List<double> latList = <double>[];
  List<double> lngList = <double>[];

  double minLat = 0.0;
  double maxLat = 0.0;
  double minLng = 0.0;
  double maxLng = 0.0;

  final MapController mapController = MapController();

  double currentZoomEightTeen = 18;

  List<Marker> markerList = <Marker>[];

  bool isLoading = false;

  double? currentZoom;

  bool getBoundsZoomValue = false;

  ///
  @override
  void initState() {
    super.initState();

    stampRallyMetro20ControllerNotifier.getAllStampRallyMetro20();

    stationControllerNotifier.getAllStation();

    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() => isLoading = true);

      // ignore: always_specify_types
      Future.delayed(const Duration(seconds: 2), () {
        setDefaultBoundsMap();

        setState(() => isLoading = false);
      });
    });
  }

  ///
  @override
  Widget build(BuildContext context) {
    makeMinMaxLatLng();

    makeMarker();

    final List<String> dateList = <String>[];

    for (final StampRallyMetro20Model element in stampRallyMetro20ControllerState.stampRallyMetro20List) {
      if (!dateList.contains(element.getDate)) {
        dateList.add(element.getDate);
      }
    }

    dateList.sort((String a, String b) => a.compareTo(b));

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            FlutterMap(
              mapController: mapController,
              options: MapOptions(
                initialCenter: const LatLng(35.718532, 139.586639),
                initialZoom: currentZoomEightTeen,
                onPositionChanged: (MapCamera position, bool isMoving) {
                  if (isMoving) {
                    appParamNotifier.setCurrentZoom(zoom: position.zoom);
                  }
                },
              ),
              children: <Widget>[
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  tileProvider: CachedTileProvider(),
                  userAgentPackageName: 'com.example.app',
                ),
                MarkerLayer(markers: markerList),
              ],
            ),
            if (!isLoading) ...<Widget>[
              Positioned(
                top: 5,
                right: 5,
                left: 5,
                child: Column(
                  children: <Widget>[
                    Image.asset('assets/images/metro_20_stamp_rally_title.png'),
                    Container(
                      width: context.screenSize.width,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: dateList.map((String e) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                child: GestureDetector(
                                  onTap: () => appParamNotifier.setSelectedGetDate(date: e),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.blueAccent.withOpacity(0.3),
                                    child: DefaultTextStyle(
                                      style: const TextStyle(fontSize: 12),
                                      child: Column(
                                        children: <Widget>[
                                          const SizedBox(height: 5),
                                          Text(e.split('-')[0]),
                                          Text('${e.split('-')[1]}-${e.split('-')[2]}'),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                          Row(
                            children: <Widget>[
                              IconButton(
                                  onPressed: () => StampRallyDialog(
                                        context: context,
                                        widget: const StampDisplayAlert(stampDisp: false),
                                        paddingTop: context.screenSize.height * 0.4,
                                      ),
                                  icon: const Icon(Icons.ac_unit, color: Colors.white)),
                              IconButton(
                                onPressed: () => appParamNotifier.setSelectedGetDate(date: ''),
                                icon: const Icon(Icons.close, color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
            if (isLoading) ...<Widget>[const Center(child: CircularProgressIndicator())],
          ],
        ),
      ),
    );
  }

  ///
  void makeMinMaxLatLng() {
    final List<double> latList = <double>[];
    final List<double> lngList = <double>[];

    for (final StampRallyMetro20Model element in stampRallyMetro20ControllerState.stampRallyMetro20List) {
      final StationModel? station = stationControllerState.stationMap[element.stationId];

      if (station != null) {
        latList.add(double.parse(station.lat));
        lngList.add(double.parse(station.lng));
      }
    }

    if (latList.isNotEmpty && lngList.isNotEmpty) {
      minLat = latList.reduce(min);
      maxLat = latList.reduce(max);
      minLng = lngList.reduce(min);
      maxLng = lngList.reduce(max);
    }
  }

  ///
  void makeMarker() {
    final Map<int, bool> map = <int, bool>{};

    for (final StampRallyMetro20Model element in stampRallyMetro20ControllerState.stampRallyMetro20List) {
      map[element.stationId] = false;

      final StationModel? station = stationControllerState.stationMap[element.stationId];

      if (station != null) {
        markerList.add(Marker(
          point: LatLng(station.lat.toDouble(), station.lng.toDouble()),
          width: 40,
          height: 40,
          child: GestureDetector(
            onTap: () {
              StampRallyDialog(
                context: context,
                widget: StampDisplayAlert(stampRallyMetro20Model: element, stampDisp: true),
                paddingTop: context.screenSize.height * 0.4,
              );
            },
            child: CircleAvatar(
              backgroundColor: (element.getDate == appParamState.selectedGetDate)
                  ? Colors.blueAccent.withOpacity(0.5)
                  : (element.getDate.isNotEmpty)
                      ? Colors.pinkAccent.withOpacity(0.5)
                      : Colors.orangeAccent.withOpacity(0.5),
              child: Text(
                station.stationName,
                style: const TextStyle(fontSize: 10, color: Colors.white),
              ),
            ),
          ),
        ));
      }
    }

    // ignore: always_specify_types
    Future(() => appParamNotifier.setStationStampFlagMap(map: map));
  }

  ///
  void setDefaultBoundsMap() {
    final LatLngBounds bounds = LatLngBounds.fromPoints(<LatLng>[LatLng(minLat, maxLng), LatLng(maxLat, minLng)]);

    final CameraFit cameraFit =
        CameraFit.bounds(bounds: bounds, padding: EdgeInsets.all(appParamState.currentPaddingIndex * 10));

    mapController.fitCamera(cameraFit);

    /// これは残しておく
    // final LatLng newCenter = mapController.camera.center;

    final double newZoom = mapController.camera.zoom;

    setState(() => currentZoom = newZoom);

    appParamNotifier.setCurrentZoom(zoom: newZoom);

    getBoundsZoomValue = true;
  }
}
