// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:islamic/Home/Providers/settings_provider.dart';

class SliderImage extends StatelessWidget {
  SliderImage({super.key, required this.img});
  String img;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          // horizontal: 40,
          // vertical: 20,
          ),
      child: Container(
        height: 50,
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          // shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(150),
          boxShadow: [
            BoxShadow(
              color: (SettingsProvider().isDark())
                  ? Colors.grey.shade900
                  : Colors.grey.shade900,
              // blurRadius: 14,
              offset: const Offset(2, 3),
            )
          ],
          // borderRadius: BorderRadius.circular(120),
          // color: Colors.amber.shade200,
        ),
        child: ClipOval(
          child: Image.asset(
            img,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
