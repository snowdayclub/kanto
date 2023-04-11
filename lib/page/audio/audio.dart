import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../logic/audio.dart';
import 'tile.dart';

class AudioPage extends StatefulWidget {
  const AudioPage({super.key});

  @override
  State<AudioPage> createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  @override
  Widget build(BuildContext context) {
    final audio = context.watch<AudioLogic>();

    return Stack(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Wrap(
            // direction: Axis.horizontal,
            children: audio.sources
                .map((element) => AudioTile(source: element))
                .toList(),
          ),
        ),
        //
        // FAB: New Resource
        //
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.settings_rounded),
            ),
          ),
        )
      ],
    );
  }
}
