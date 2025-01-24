import '../extensions/extensions.dart';

class StampRallyMetro20Model {
  StampRallyMetro20Model({required this.id, required this.stationId, required this.stationName, required this.getDate});

  factory StampRallyMetro20Model.fromJson(Map<String, dynamic> json) => StampRallyMetro20Model(
        id: json['id'].toString().toInt(),
        stationId: json['station_id'].toString().toInt(),
        stationName: json['station_name'].toString(),
        getDate: json['get_date'].toString(),
      );
  int id;
  int stationId;
  String stationName;
  String getDate;

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'id': id, 'station_id': stationId, 'station_name': stationName, 'get_date': getDate};
}
