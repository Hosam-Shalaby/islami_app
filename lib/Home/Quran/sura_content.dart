import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic/Home/Quran/surah_title.dart';
import 'package:islamic/Home/Quran/verses_title.dart';

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
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      'assets/images/default_bg.png',
                    ))),
            child: Scaffold(
              appBar: AppBar(
                title: Text(args.Title),
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  margin: const EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  child: ListView.builder(
                    itemBuilder: (context, index) =>
                        VersesTitle(versesTitle: verses[index]),
                    itemCount: verses.length,
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
