import 'package:flutter/material.dart';

class SebhaTab extends StatelessWidget {
  const SebhaTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                  margin: const EdgeInsets.only(left: 20),
                  height: 80,
                  child: Image.asset('assets/images/head_sebha_logo.png')),
              Container(
                  margin: const EdgeInsets.only(top: 60),
                  height: 180,
                  child: Image.asset('assets/images/body_sebha_logo.png'))
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('عدد التسبيحات')],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 40,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(width: 1),
                  color: Theme.of(context).primaryColor,
                ),
                child: const Center(
                  child: Text(
                    '30',
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
