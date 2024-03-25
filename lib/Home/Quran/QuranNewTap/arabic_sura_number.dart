import 'package:Ayat/Home/Quran/QuranNewTap/to_arabic_no_converter.dart';
import 'package:flutter/material.dart';

class ArabicSuraNumber extends StatelessWidget {
  const ArabicSuraNumber({super.key, required this.i});

  final int i;

  @override
  Widget build(BuildContext context) {
    return Text(
      (i + 1).toString().toArabicNumbers,
      // '\uFD3E${(i + 1).toString().toArabicNumbers}\uFD3f',
      style: Theme.of(context).textTheme.titleMedium,
      // const TextStyle(
      //   color: CustomColors.arabicFontColor,
      //   fontFamily: 'quran',
      //   fontSize: 35,
      //   shadows: [
      //     Shadow(
      //         offset: Offset(.5, .5),
      //         blurRadius: 1.0,
      //         color: Colors.amberAccent),
      //   ],
      // ),
    );
  }
}
