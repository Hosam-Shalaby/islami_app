import 'package:Ayat/Home/Quran/QuranNewTap/constant.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});
  static const String routeName = 'Settings';
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'الاعدادات',
          ),
          backgroundColor: const Color.fromARGB(255, 40, 57, 112),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // const Text(
                  //   'حجم الخط ',
                  //   style: TextStyle(
                  //     color: Colors.black,
                  //     fontWeight: FontWeight.bold,
                  //     fontSize: 15,
                  //   ),
                  // ),
                  // Slider(
                  //   value: arabicFontSize,
                  //   min: 20,
                  //   max: 40,
                  //   onChanged: (value) {
                  //     setState(() {
                  //       arabicFontSize = value;
                  //     });
                  //   },
                  // ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Divider(),
                  ),
                  const Text(
                    'حجم الخط في المصحف',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Slider(
                    value: mushufFontSize,
                    min: 20,
                    max: 50,
                    onChanged: (value) {
                      setState(() {
                        mushufFontSize = value;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "‏ ‏‏ ‏‏‏‏ ‏‏‏‏‏‏ ‏",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'quran',
                        fontSize: mushufFontSize),
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            arabicFontSize = 28;
                            mushufFontSize = 40;
                          });
                          saveSetting();
                        },
                        child: const Text(
                          'إعادة ضبط',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          saveSetting();
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          'حفظ',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}