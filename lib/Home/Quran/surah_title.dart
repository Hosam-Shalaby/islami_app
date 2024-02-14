// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:flutter/material.dart';

import 'sura_content.dart';

class SuraName extends StatelessWidget {
  SuraName({super.key, required this.suraArgs});
  SuraArgs suraArgs;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SuraContent.routeName,
            arguments: SuraArgs(Title: suraArgs.Title, Index: suraArgs.Index));
      },
      child: Text(
        suraArgs.Title.toString(),
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class SuraArgs {
  var Title;
  int Index;
  SuraArgs({required this.Title, required this.Index});
}
