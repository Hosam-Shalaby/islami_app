import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:islamic/Home/Compass/compass_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Compass extends StatefulWidget {
  const Compass({super.key});
  static const String routeName = 'Compass';
  @override
  State<Compass> createState() => _CompassState();
}

class _CompassState extends State<Compass> {
  @override
  Widget build(BuildContext context) {
    final deviceSupport = FlutterQiblah.androidDeviceSensorSupport();

    return Scaffold(
      appBar: AppBar(title: Text((AppLocalizations.of(context)!.islami))),
      body: FutureBuilder(
        future: deviceSupport,
        builder: (_, AsyncSnapshot<bool?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error.toString()}"),
            );
          }
          if (snapshot.data!) {
            return const QiblahCompass();
          } else {
            return const Center(
              child: Text("Your device is not supported"),
            );
          }
        },
      ),
    );
  }
}
