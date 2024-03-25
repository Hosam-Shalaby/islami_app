// ignore_for_file: unused_local_variable

import 'package:Ayat/Home/Azkar/azkar.dart';
import 'package:Ayat/Home/Providers/settings_provider.dart';
import 'package:Ayat/Home/widgets/slider_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class AzkarScreen extends StatefulWidget {
  const AzkarScreen({super.key});

  @override
  State<AzkarScreen> createState() => _AzkarScreenState();
}

class _AzkarScreenState extends State<AzkarScreen> {
  List<String> azkar = [
    // 'أصبحنا على فطرة الإسلام، وعلى كلمة الإخلاص، وعلى دين نبينا محمد صلى الله عليه وسلم، وعلى ملة أبينا إبراهيم حنيفًا مسلمًا وما كان من المشركين',
    'اللهم بك أصبحنا، وبك أمسينا، وبك نحيا، وبك نموت، وإليك المصير',
    'اللهم ما أصبح بي من نعمة أو بأحدٍ من خلقك فمنك وحدك لا شريك لك، فلك الحمد ولك الشكر',
    'أصبحنا وأصبح الملك لله، والحمد لله، لا شريك له',
    'اللهم عافني في بدني، اللهم عافني في سمعي، اللهم عافني في بصري، لا إله إلا أنت',
    'أصبحنا وأصبح الملك لله والحمد لله، لا إله إلا الله وحده لا شريك له، له الملك وله الحمد وهو على كل شيء قدير، رب أسألك خير ما في هذا اليوم وخير ما بعده، وأعوذ بك من شر ما في هذا اليوم وشر ما بعده، رب أعوذ بك من الكسل وسوء الكبر، رب أعوذ بك من عذاب في النار وعذاب في القبر',
    'اللهم بك أمسينا، وبك أصبحنا، وبك نحيا، وبك نموت، وإليك المصير',
    'اللهم عافني في بدني، اللهم عافني في سمعي، اللهم عافني في بصري، لا إله إلا أنت',
    'اللهم إني أمسيت أشهدك وأشهد حملة عرشك، وملائكتك، وجميع خلقك، أنك أنت الله لا إله إلا أنت وحدك لا شريك لك، وأن محمدًا عبدك ورسولك',
    'اللهم إني أمسيت وجهي لك وأعزمت حلفاءك، وأسلمت ظهري لك، والأمر كله لك رغبة ورهبة، لا ملجأ ولا منجا منك إلا إليك، آمنت بكتابك الذي أنزلت، وبنبيك الذي أرسلت',
    'سبحان الله وبحمده',
    'سبحان الله العظيم',
    'رَبِّ اشْرَحْ لِي صَدْرِي وَيَسِّرْ لِي أَمْرِي',
    'رَبِّ زِدْنِي عِلْمًا',
    'رَبِّ اشْرَحْ لِي صَدْرِي وَيَسِّرْ لِي أَمْرِي',
    'رَبِّ اجْعَلْنِي مُقِيمَ الصَّلَاةِ وَمِن ذُرِّيَّتِي رَبَّنَا وَتَقَبَّلْ دُعَاءِ',
    'رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الآخِرَةِ حَسَنَةً وَقِنَا عَذَابَ النَّارِ',
    'رَبَّنَا لَا تُزِغْ قُلُوبَنَا بَعْدَ إِذْ هَدَيْتَنَا وَهَبْ لَنَا مِن لَّدُنكَ رَحْمَةً إِنَّكَ أَنتَ الْوَهَّابُ',
    'رَبَّنَا عَلَيْكَ تَوَكَّلْنَا وَإِلَيْكَ أَنَبْنَا وَإِلَيْكَ الْمَصِيرُ',
    'رَبَّنَا آمَنَّا بِمَا أَنزَلْتَ وَاتَّبَعْنَا الرَّسُولَ فَاكْتُبْنَا مَعَ الشَّاهِدِينَ',
    'رَبَّنَا أَفْرِغْ عَلَيْنَا صَبْرًا وَتَوَفَّنَا مُسْلِمِينَ',
    'رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الْآخِرَةِ حَسَنَةً وَقِنَا عَذَابَ النَّارِ',
    'رَبَّنَا آتِنَا مِن لَّدُنكَ رَحْمَةً وَهَيِّئْ لَنَا مِنْ أَمْرِنَا رَشَدًا',
    'رَبَّنَا افْتَحْ بَيْنَنَا وَبَيْنَ قَوْمِنَا بِالْحَقِّ وَأَنتَ خَيْرُ الْفَاتِحِينَ',
    'رَبَّنَا لَا تُؤَاخِذْنَا إِن نَّسِينَا أَوْ أَخْطَأْنَا',
    'رَبَّنَا وَلَا تَحْمِلْ عَلَيْنَا إِصْرًا كَمَا حَمَلْتَهُ عَلَى الَّذِينَ مِن قَبْلِنَا',
    'رَبَّنَا وَلَا تُحَمِّلْنَا مَا لَا طَاقَةَ لَنَا بِهِ',
    'رَبَّنَا وَاعْفُ عَنَّا وَاغْفِرْ لَنَا وَارْحَمْنَا',
    'أَنتَ مَوْلَانَا فَانصُرْنَا عَلَى الْقَوْمِ الْكَافِرِينَ',
    'رَبَّنَا لَا تَجْعَلْنَا فِتْنَةً لِّلَّذِينَ كَفَرُوا',
    'رَبَّنَا وَلا تُزِغْ قُلُوبَنَا بَعْدَ إِذْ هَدَيْتَنَا',
    'رَبَّنَا إِنَّكَ جَامِعُ النَّاسِ لِيَوْمٍ لَّا رَيْبَ فِيهِ',
    'رَبَّنَا عَلَيْكَ تَوَكَّلْنَا وَإِلَيْكَ أَنَبْنَا وَإِلَيْكَ الْمَصِيرُ',
    'رَبَّنَا لَا تَجْعَلْنَا فِتْنَةً لِّلْقَوْمِ الظَّالِمِينَ',
  ];

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
var mediaQuery = MediaQuery.of(context).size;
    var width = mediaQuery.width;
    var height = mediaQuery.height;
    return Column(
      children: [
        const SizedBox(height: 25),
        CarouselSlider(
          options: CarouselOptions(
            enlargeCenterPage: true,
            pauseAutoPlayOnManualNavigate: true,
            autoPlay: true,
            viewportFraction: 0.8,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 6000),
            autoPlayCurve: Curves.fastOutSlowIn,
          ),
          items: [
            SliderImage(
              img: 'assets/App/4.png',
            ),
            SliderImage(
              img: 'assets/App/5.png',
            ),
            SliderImage(
              img: 'assets/App/2.png',
            ),
            SliderImage(
              img: 'assets/App/3.png',
            ),
            SliderImage(
              img: 'assets/App/6.png',
            ),
            SliderImage(
              img: 'assets/App/7.png',
            ),
            SliderImage(
              img: 'assets/App/8.png',
            ),
            SliderImage(
              img: 'assets/App/9.png',
            ),
            SliderImage(
              img: 'assets/App/10.png',
            ),
            SliderImage(
              img: 'assets/App/11.png',
            ),
            SliderImage(
              img: 'assets/App/12.png',
            ),
            SliderImage(
              img: 'assets/App/13.png',
            ),
            SliderImage(
              img: 'assets/App/14.png',
            ),
            SliderImage(
              img: 'assets/App/15.png',
            ),
            SliderImage(
              img: 'assets/App/16.png',
            ),
            SliderImage(
              img: 'assets/App/17.png',
            ),
            SliderImage(
              img: 'assets/App/18.png',
            ),
            SliderImage(
              img: 'assets/App/19.png',
            ),
            SliderImage(
              img: 'assets/App/20.png',
            ),

            // ),
          ],
        ),
        const SizedBox(height: 20),
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) => Azkar(
                    zekr: azkar[index],
                  ),
              separatorBuilder: (context, index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 33),
                  color: Theme.of(context).dividerColor,
                  width: double.infinity,
                  height: 2),
              itemCount: azkar.length),
        )
      ],
    );
  }
}
