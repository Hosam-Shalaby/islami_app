import 'package:flutter/material.dart';
import 'package:islamic/Home/Hadeth/hadeth_tab.dart';
import 'package:provider/provider.dart';

import '../Providers/settings_provider.dart';

class HadethDetailsScreen extends StatelessWidget {
  const HadethDetailsScreen({super.key});
  static const String routeName = 'HadethDetailsScreen';
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);

    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(settingsProvider.getBackGround()))),
      child: Scaffold(
        appBar: AppBar(title: const Text('Islami')),
        body: SingleChildScrollView(
          child: Card(
              color: Theme.of(context).cardColor,
              margin: const EdgeInsets.all(10),
              // shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  const Divider(),
                  Text(
                    args.title,
                    textDirection: TextDirection.rtl,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      args.content,
                      style: Theme.of(context).textTheme.bodyMedium,
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  )
                ],
              )),
        ),
      ),
    );
  }
}
