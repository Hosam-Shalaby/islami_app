import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double angel = 100;
  int counter = 0;
  int currentZekr = 0;
  List<String> texts = ['سبحان الله', 'الحمدلله', ' الله أكبر'];
  @override
  Widget build(BuildContext context) {
    // var settingsProvider = Provider.of<SettingsProvider>(context);

    return Scaffold(
      body: InkWell(
        onTap: () {
          onClick();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                    margin: const EdgeInsets.only(left: 20),
                    height: 80.h,
                    child: Image.asset('assets/images/head_sebha_logo.png')),
                Container(
                    margin: const EdgeInsets.only(top: 60),
                    height: 180.h,
                    child: InkWell(
                      onTap: () {
                        onClick();
                      },
                      child: Transform.rotate(
                          angle: angel,
                          child:
                              Image.asset('assets/images/body_sebha_logo.png')),
                    ))
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('عدد التسبيــحات',
                    style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
            InkWell(
              onTap: () {
                onClick();
              },
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 150, vertical: 10),
                padding: const EdgeInsets.all(10),
                height: 60.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  // border: Border.all(width: 1),
                  color: Theme.of(context).primaryColor,
                ),
                child: Center(
                  child: Text(
                    '$counter',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            InkWell(
              onTap: () {
                onClick();
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 100),
                height: 60.h,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  // border: Border.all(width: 1),
                  color: Theme.of(context).primaryColor,
                ),
                child: Center(
                  child: Text(
                    texts[currentZekr],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  onClick() {
    // rotate photo
    angel++;
    // change zekr text
    if (counter == 33) {
      currentZekr++;
    }
    currentZekr = currentZekr % texts.length;
    // change counter
    if (counter >= 33) {
      counter = 0;
    } else {
      counter++;
    }

    setState(() {});
  }
}
