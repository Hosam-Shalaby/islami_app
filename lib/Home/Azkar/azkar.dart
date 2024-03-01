// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class Azkar extends StatelessWidget {
  Azkar({super.key, required this.zekr});
  String zekr;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      child: Text(
        zekr, textAlign: TextAlign.center,

        style: Theme.of(context).textTheme.titleMedium,
        // textDirection: TextDirection.,
      ),
    );
  }
}
