import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../extensions/extensions.dart';
import '../../models/stamp_rally_metro_20_model.dart';

class StampDisplayAlert extends ConsumerStatefulWidget {
  const StampDisplayAlert({
    super.key,
    this.stampRallyMetro20Model,
    required this.stampDisp,
  });

  final StampRallyMetro20Model? stampRallyMetro20Model;
  final bool stampDisp;

  @override
  ConsumerState<StampDisplayAlert> createState() => _StampDisplayAlertState();
}

class _StampDisplayAlertState extends ConsumerState<StampDisplayAlert> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Container(width: context.screenSize.width),
              if (widget.stampDisp && widget.stampRallyMetro20Model != null) ...<Widget>[
                Image.asset('assets/stamps/metro_stamp_20_${widget.stampRallyMetro20Model!.stamp}.png'),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(),
                    Text(
                      widget.stampRallyMetro20Model!.getDate,
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              ],
              if (!widget.stampDisp) ...<Widget>[Image.asset('assets/images/chikatetsu_museum.png')],
            ],
          ),
        ),
      ),
    );
  }
}
