import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islamic/Home/Providers/settings_provider.dart';
import 'package:islamic/Home/Radio/radios_response.dart';
import 'package:provider/provider.dart';

class RadioItem extends StatefulWidget {
  final RadioStation radioStation;
  final AudioPlayer player;

  const RadioItem(
      {super.key, required this.radioStation, required this.player});

  @override
  State<RadioItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {
  String _currentState = 'pause';

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var appProvider = Provider.of<SettingsProvider>(context);
    var mediaQuery = MediaQuery.of(context).size;
    return Container(
      height: mediaQuery.height,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: theme.colorScheme.primary)),
      width: mediaQuery.width * .4,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.radioStation.name!,
            // locale.quranRadioStation,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
            // style: theme.textTheme.titleLarge,
          ),
          const SizedBox(height: 25),
          InkWell(
            onTap: () async {
              if (_currentState == 'pause') {
                await widget.player.play(UrlSource(widget.radioStation.url!));
                _currentState = 'play';
              } else {
                await widget.player.pause();
                _currentState = 'pause';
              }
              setState(() {});
            },
            child: Container(
              padding: const EdgeInsets.all(15),
              width: 65,
              height: 65,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(55),
                  border: Border.all(color: theme.colorScheme.primary)),
              child: ImageIcon(
                AssetImage((_currentState == 'pause')
                    ? 'assets/images/play_icon.png'
                    : 'assets/images/pause_icon.png'),
                color: (appProvider.isDark())
                    ? theme.colorScheme.onSecondary
                    : theme.colorScheme.primary,
                size: 30,
              ),
            ),
          ),
        
        ],
      ),
    );
  }
}
