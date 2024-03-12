// ignore_for_file: library_private_types_in_public_api, avoid_print, unused_field

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:islamic/Home/PrayTimes/data.dart';
import 'package:islamic/Home/PrayTimes/json_connection.dart';
import 'package:http/http.dart' as http;
import 'package:islamic/Home/Providers/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PrayTimes extends StatefulWidget {
  const PrayTimes({super.key});
  static const String routeName = 'Pray_Times';

  @override
  _PrayTimesState createState() => _PrayTimesState();
}

class _PrayTimesState extends State<PrayTimes> {
  JsonConnection jsonConnection = JsonConnection();
  Data? list;

  static String city = 'Dammam';
  static String country = 'Saudi Arabia';
  static int method = 4;

  final String url =
      'http://api.aladhan.com/v1/timingsByCity?city=$city&method=$method';
  Future getPTData() async {
    //  Uri uri = ;

    Uri uri = Uri.parse(Uri.encodeFull(url));
    http.Response res = await http.get(uri, headers: {
      "Accept":
          "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8"
    });
    print('Response status code: ${res.statusCode}');
    print('Response body: ${res.body}');
    final data = jsonDecode(res.body);
    print('Decoded data: $data');

    list = Data.fromJson(data);

    return list;
  }

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);

    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(settingsProvider.backgroundImage()))),
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.prayTimes,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            // backgroundColor: const Color.fromARGB(255, 5, 43, 75),
          ),
          body: FutureBuilder(
            future: jsonConnection.getPTLocation(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            snapshot.data.data.meta.timezone,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                AppLocalizations.of(context)!.fajr,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Text(
                                AppLocalizations.of(context)!.dhuhr,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Text(
                                AppLocalizations.of(context)!.asr,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Text(
                                AppLocalizations.of(context)!.maghrib,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Text(
                                AppLocalizations.of(context)!.isha,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                snapshot.data.data.timings.fajr,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Text(
                                snapshot.data.data.timings.dhuhr,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Text(
                                snapshot.data.data.timings.asr,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Text(
                                snapshot.data.data.timings.maghrib,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Text(
                                snapshot.data.data.timings.isha,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ));
  }
}
// import 'package:flutter/material.dart';

// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';

// class PrayerTimesScreen extends StatefulWidget {
//   const PrayerTimesScreen({Key? key}) : super(key: key);

//   @override
//   State<PrayerTimesScreen> createState() => _PrayerTimesScreenState();
// }

// class _PrayerTimesScreenState extends State<PrayerTimesScreen> {
//   Location? _userLocation;
//   PrayersTimes? _prayerTimes;

//   @override
//   void initState() {
//     super.initState();
//     _getLocation();
//   }

//   void _getLocation() async {
//     try {
//       final location = await Geolocator.getCurrentPosition();
//       setState(() {
//         _userLocation = Location(
//           latitude: location.latitude,
//           longitude: location.longitude,
//         );
//         _getPrayerTimes();
//       });
//     } catch (e) {
//       print('Error getting location: $e');
//     }
//   }

//   void _getPrayerTimes() async {
//     if (_userLocation != null) {
//       final prayerTimes = PrayersTimes.getPrayerTimesForToday(_userLocation!);
//       setState(() {
//         _prayerTimes = prayerTimes;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('مواقيت الصلاة'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'موقعك:',
//               style: TextStyle(fontSize: 18),
//             ),
//             Text(
//               _userLocation?.toString() ?? '... جاري التحميل',
//               style: TextStyle(fontSize: 16),
//             ),
//             const SizedBox(height: 16),
//             Text(
//               'مواقيت الصلاة:',
//               style: TextStyle(fontSize: 18),
//             ),
//             _prayerTimes != null
//                 ? _buildPrayerTimesList(_prayerTimes!)
//                 : Text('... جاري التحميل'),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildPrayerTimesList(PrayersTimes prayerTimes) {
//     return Column(
//       children: [
//         _buildPrayerTimeRow('الفجر', prayerTimes.fajr),
//         _buildPrayerTimeRow('الظهر', prayerTimes.dhuhr),
//         _buildPrayerTimeRow('العصر', prayerTimes.asr),
//         _buildPrayerTimeRow('المغرب', prayerTimes.maghrib),
//         _buildPrayerTimeRow('العشاء', prayerTimes.isha),
//       ],
//     );
//   }

//   Widget _buildPrayerTimeRow(String name, PrayerTime prayerTime) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           name,
//           style: TextStyle(fontSize: 16),
//         ),
//         Text(
//           prayerTime.toString(),
//           style: TextStyle(fontSize: 16),
//         ),
//       ],
//     );
//   }
// }

// class Location {
//   final double latitude;
//   final double longitude;
//   final double? altitude;
//   final double? accuracy;
//   final double? speed;
//   final double? speedAccuracy;
//   final DateTime? timestamp;

//   const Location({
//     required this.latitude,
//     required this.longitude,
//     this.altitude,
//     this.accuracy,
//     this.speed,
//     this.speedAccuracy,
//     this.timestamp,
//   });

//   @override
//   String toString() => 'Location(latitude: $latitude, longitude: $longitude)';
// }
// class PrayersTimes {
//   final double latitude;
//   final double longitude;
//   final int year;
//   final int month;
//   final PrayerTimesMethod method;

//   const PrayersTimes({
//     required this.latitude,
//     required this.longitude,
//     required this.year,
//     required this.month,
//     this.method = PrayerTimesMethod.karachi,
//   });

//   PrayersTimes.getPrayerTimes(Location location, int year, int month)
//       : this(
//           latitude: location.latitude,
//           longitude: location.longitude,
//           year: year,
//           month: month,
//         );

//   PrayersTimes.getPrayerTimesForToday(Location location)
//       : this(
//           latitude: location.latitude,
//           longitude: location.longitude,
//           year: DateTime.now().year,
//           month: DateTime.now().month,
//         );

//   Fajr get fajr => _getPrayerTime(PrayerTimesType.fajr);

//   Dhuhr get dhuhr => _getPrayerTime(PrayerTimesType.dhuhr);

//   Asr get asr => _getPrayerTime(PrayerTimesType.asr);

//   Maghrib get maghrib => _getPrayerTime(PrayerTimesType.maghrib);

//   Isha get isha => _getPrayerTime(PrayerTimesType.isha);

//   PrayerTime _getPrayerTime(PrayerTimesType type) {
    
//     final prayerTime = PrayerTimesCalculator.getPrayerTime(
//       latitude,
//       longitude,
//       year,
//       month,
//       method,
//       type,
//     );
//     return PrayerTime(
//       hour: prayerTime.hour,
//       minute: prayerTime.minute,
//       second: prayerTime.second,
//     );
//   }
// }

// enum PrayerTimesType { fajr, dhuhr, asr, maghrib, isha }

// enum PrayerTimesMethod {
//   karachi,
//   isna,
//   egypt,
//   makkah,
//   tehran,
//   jafari
// }

// class PrayerTime {
//   final int hour;
//   final int minute;
//   final int second;

//   const PrayerTime({
//     required this.hour,
//     required this.minute,
//     required this.second,
//   });

//   @override
//   String toString() => '$hour:$minute:$second';
// }
// class PrayerTimesCalculator {
//   static PrayerTime getPrayerTime(
//       double latitude,
//       double longitude,
//       int year,
//       int month,
//       PrayerTimesMethod method,
//       PrayerTimesType type) {
//     // ... Implement null checks and handle potential null values in the native implementation (_getPrayerTimeNative)
//     final prayerTime = _getPrayerTimeNative(
//       latitude,
//       longitude,
//       year,
//       month,
//       method.index,
//       type.index,
//     );
//     return PrayerTime(
//       hour: prayerTime.hour,
//       minute: prayerTime.minute,
//       second: prayerTime.second,
//     );
//   }

//   static PrayerTime _getPrayerTimeNative(
//       double latitude,
//       double longitude,
//       int year,
//       int month,
//       int method,
//       int type) {
//     // ... Native implementation (needs modification for null safety)
//   }
// }
