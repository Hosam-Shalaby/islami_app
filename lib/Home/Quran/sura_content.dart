import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic/Home/Quran/surah_title.dart';
import 'package:islamic/Home/Quran/verses_title.dart';
import 'package:islamic/Styles/theme_data.dart';

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
                    image: AssetImage(
                      MyThemeData.isDarkSelected
                          ? 'assets/images/dark_bg.png'
                          : 'assets/images/default_bg.png',
                    ))),
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
                        VersesTitle(versesTitle: verses[index]),
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
    List<String> suraLines = fileContent.split('\n');
    setState(() {
      verses = suraLines;
    });
  }
}
