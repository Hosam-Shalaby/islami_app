import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic/Home/Hadeth/hadeth_title.dart';

class HadethTab extends StatefulWidget {
  const HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> ahadeth = [];

  @override
  Widget build(BuildContext context) {
    if (ahadeth.isEmpty) {
      loadHadethFile();
    }
    return ahadeth.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/hadeth_logo.png',
                height: 180,
              ),
              Container(
                color: const Color(0xFFB7935F),
                width: double.infinity,
                height: 2,
              ),
              const Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  'ahadeth',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                color: const Color(0xFFB7935F),
                width: double.infinity,
                height: 2,
              ),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) =>
                        HadethTitle(hadeth: ahadeth[index]),
                    separatorBuilder: (context, index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 33),
                          color: const Color(0xFFB7935F),
                          width: double.infinity,
                          height: 2,
                        ),
                    itemCount: ahadeth.length),
              )
            ],
          );
  }

  void loadHadethFile() async {
    String fileContent =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> allAhadeth = fileContent.trim().split('#');
    for (int i = 0; i < allAhadeth.length; i++) {
      List<String> hadethLines = allAhadeth[i].trim().split('\n');
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      String hadethContent = hadethLines.join('\n');
      Hadeth hadeth = Hadeth(title: title, content: hadethContent);
      ahadeth.add(hadeth);
    }
    setState(() {});
  }
}

class Hadeth {
  String title;
  String content;
  Hadeth({required this.title, required this.content});
}
