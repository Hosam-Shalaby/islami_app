// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import 'constant.dart';
import '../../widgets/sura_name.dart';
import 'arabic_sura_number.dart';
import 'surah_builder.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});
  static const String routeName = 'quran';
  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: const MyDrawer(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   tooltip: 'Go to bookmark',
      //   backgroundColor: Colors.amber,
      //   onPressed: () async {
      //     fabIsClicked = true;
      //     if (await readBookmark() == true) {
      //       GoRouter.of(context).push(AppRouter.kSurahBuilderView);
      //     }
      //   },
      //   child: const Icon(Icons.bookmark),
      // ),
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: const Text(
      //     "القرآن الكريم",
      //     style: TextStyle(
      //         fontFamily: 'me_quran',
      //         fontSize: 35,
      //         fontWeight: FontWeight.w600,
      //         shadows: [
      //           Shadow(
      //             offset: Offset(1, 1),
      //             blurRadius: 2.0,
      //             color: CustomColors.ayaTextBoldColor,
      //           ),
      //         ]),
      //   ),
      //   backgroundColor: CustomColors.appColor,
      // ),
      body: FutureBuilder(
        future: readJson(),
        builder: (
          BuildContext context,
          AsyncSnapshot snapshot,
        ) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Text('Error');
            } else if (snapshot.hasData) {
              return indexCreator(snapshot.data, context);
            } else {
              return const Text('Empty data');
            }
          } else {
            return Text('State: ${snapshot.connectionState}');
          }
        },
      ),
    );
  }

  Widget indexCreator(quran, context) {
    return Column(
      children: [
        Expanded(
            flex: 1,
            child: Image.asset('assets/images/qur2an_screen_logo.png')),
        Divider(
          color: Theme.of(context).dividerColor,
          height: 17,
          thickness: 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ' أسم السـورة',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            VerticalDivider(color: Theme.of(context).dividerColor, width: 50),
            Text(
              'رقم السـورة ',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            // Divider(color: Color(0xFFB7935F)),
          ],
        ),
        Divider(
          color: Theme.of(context).dividerColor,
          height: 17,
          thickness: 2,
        ),
        Expanded(
          flex: 2,
          child: ListView(
            children: [
              for (int i = 0; i < 114; i++)
                Container(
                  color: i % 2 == 0
                      // ? CustomColors.suraBackColor1
                      // : CustomColors.suraBackColor2,
                      ? Colors.transparent
                      : Colors.transparent,
                  child: TextButton(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            arabicName[i]['name'],
                            style: Theme.of(context).textTheme.titleMedium,
                            //  TextStyle(

                            //     // fontSize: 25,
                            //     // color: Colors.black87,
                            //     // fontFamily: 'quran',
                            //     // shadows: [
                            //     //   Shadow(
                            //     //     offset: Offset(.5, .5),
                            //     //     blurRadius: 1.0,
                            //     //     color: CustomColors.someWhatGreyColor,
                            //     //   )
                            //     // ]
                            //     ),
                            textDirection: TextDirection.rtl,
                          ),
                          // const SizedBox(
                          //   width: 5,
                          // ),
                          ArabicSuraNumber(i: i),
                        ],
                      ),
                    ),
                    onPressed: () {
                      fabIsClicked = false;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SurahBuilder(
                                  arabic: quran[0],
                                  sura: i,
                                  suraName: arabicName[i]['name'],
                                  ayah: 0,
                                )),
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
