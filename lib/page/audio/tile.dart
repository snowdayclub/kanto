import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../logic/audio.dart';
import '../../logic/player.dart';
import '../../model/audio.dart';
import '../../model/radio.dart';

class AudioTile extends StatefulWidget {
  final AudioResource source;
  const AudioTile({required this.source, super.key});

  @override
  State<AudioTile> createState() => _AudioTileState();
}

class _AudioTileState extends State<AudioTile> {
  // _showResourceDetails(BuildContext context, AudioResource source) {
  //   const textStyle = TextStyle(
  //     overflow: TextOverflow.ellipsis,
  //   );
  //   showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: Text(source.name),
  //       content: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           Text(source.type.name, style: textStyle),
  //           Text(source.tags, style: textStyle),
  //           source.type == ResourceType.radio
  //               ? Text((source as RadioStation).homepage, style: textStyle)
  //               : Container(),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final player = context.watch<PlayerLogic>();

    final isPlaying = player.isPlaying(widget.source);
    const fontColor = Colors.white;
    const shadows = <Shadow>[
      Shadow(
        offset: Offset(0.0, 0.0),
        blurRadius: 3.0,
        color: Color.fromARGB(255, 228, 228, 0),
      ),
    ];

    const titleStyle = TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: fontColor,
      shadows: shadows,
      overflow: TextOverflow.ellipsis,
    );
    return Card(
      // surfaceTintColor: Colors.red,
      // elevation: player.isPlaying(widget.source) ? 8 : 2,
      color: isPlaying
          ? const Color.fromARGB(180, 8, 108, 185)
          : const Color.fromARGB(80, 6, 80, 137),
      child: InkWell(
        onLongPress: () {
          // _showResourceDetails(context, widget.source);
          final audio = context.read<AudioLogic>();
          audio.delete(widget.source);
        },
        onTap: () {
          isPlaying ? player.pause() : player.play(widget.source);
        },
        child: Container(
          width: 170,
          height: 90,
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.source.getShortName(),
                  maxLines: player.isPlaying(widget.source) ? 1 : 2,
                  style: titleStyle,
                  textAlign: TextAlign.center,
                ),
                player.isPlaying(widget.source)
                    ? const Icon(
                        Icons.pause_rounded,
                        size: 36.0,
                        color: fontColor,
                        shadows: shadows,
                      )
                    : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
