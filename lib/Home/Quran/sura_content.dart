import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic/Home/Providers/settings_provider.dart';
import 'package:islamic/Home/Quran/surah_title.dart';
import 'package:provider/provider.dart';

class SuraContent extends StatefulWidget {
  const SuraContent({super.key});
  static const String routeName = 'SuraContent';

  @override
  State<SuraContent> createState() => _SuraContentState();
}

class _SuraContentState extends State<SuraContent> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);

    var args = ModalRoute.of(context)?.settings.arguments as SuraArgs;
    if (verses.isEmpty) {
      readQuranFile(args.Index);
    }

    return verses.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(settingsProvider.backgroundImage()))),
            child: Scaffold(
              appBar: AppBar(
                title: Text(args.Title),
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Theme.of(context).cardColor,
                  margin: const EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  child: ListView.separated(
                    itemBuilder: (context, index) =>
                        // VersesTitle(versesTitle: verses[index],),
                        Text(' ${verses[index]} (${index + 1})',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyMedium),
                    itemCount: verses.length,
                    separatorBuilder: (context, index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(
                        color: Theme.of(context).dividerColor,
                      ),
                    ),
                  ),
                ),
              ),
            ));
  }

  void readQuranFile(int index) async {
    String fileContent =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> suraLines = fileContent.trim().split('\n');
    setState(() {
      verses = suraLines;
    });
  }
}
