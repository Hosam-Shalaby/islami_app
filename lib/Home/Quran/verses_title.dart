// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class VersesTitle extends StatelessWidget {
  VersesTitle({super.key, required this.versesTitle});
  String versesTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      alignment: Alignment.center,
      child: Text(versesTitle,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold)),
    );
  }
}
