// ignore_for_file: must_be_immutable

import 'package:Ayat/Home/Hadeth/hadeth_details_screen.dart';
import 'package:Ayat/Home/Hadeth/hadeth_tab.dart';
import 'package:flutter/material.dart';


class HadethTitle extends StatelessWidget {
  HadethTitle({super.key, required this.hadeth});

  Hadeth hadeth;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, HadethDetailsScreen.routeName,
            arguments: Hadeth(title: hadeth.title, content: hadeth.content));
      },
      child: Container(
          padding: const EdgeInsets.all(10),
          alignment: Alignment.center,
          child: Text(
            hadeth.title,
            style: Theme.of(context).textTheme.titleMedium,
          )),
    );
  }
}
