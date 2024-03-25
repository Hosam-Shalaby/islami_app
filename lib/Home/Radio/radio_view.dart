// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:Ayat/Home/Providers/settings_provider.dart';
import 'package:Ayat/Home/Radio/radio_item.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:provider/provider.dart';

import 'radios_response.dart';

class RadioView extends StatefulWidget {
  const RadioView({super.key});

  @override
  State<RadioView> createState() => _RadioViewState();
}

class _RadioViewState extends State<RadioView> {
  final player = AudioPlayer();

  Future<RadiosResponse> getRadios(String currentLanguage) async {
    currentLanguage = (currentLanguage == 'en') ? 'en' : 'ar';
    var uri = Uri.parse(
        "https://mp3quran.net/api/v3/radios?language=$currentLanguage");
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      return RadiosResponse.fromJson(result);
    } else {
      throw Exception('Failed to load radios');
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context).size;
    var appProvider = Provider.of<SettingsProvider>(context);

    return Column(
      children: [
        // SizedBox(height: mediaQuery.height / 20),
        Image.asset('assets/images/radio_header.png'),
        const SizedBox(height: 10),
        FutureBuilder<RadiosResponse>(
          future: getRadios(appProvider.currentLanguage),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.zero,
                  physics: const PageScrollPhysics(),
                  itemCount: snapshot.data!.radios!.length,
                  itemBuilder: (context, index) {
                    return RadioItem(
                        radioStation: snapshot.data!.radios![index],
                        player: player);
                  },
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  "Check your internet connection",
                  style: theme.textTheme.titleLarge,
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(
                color: theme.colorScheme.onSecondary,
              ),
            );
          },
        ),
      ],
    );
  }
}
