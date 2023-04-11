import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:uuid/uuid.dart';

import '../model/audio.dart';
import '../model/radio.dart';

class PlayerLogic extends ChangeNotifier {
  PlayerLogic();
  final _player = AudioPlayer();
  bool _isPlaying = false;

  AudioPlayer get player => _player;
  // bool get playing => _player.playing;
  bool get playing => _isPlaying;
  UuidValue? _sourceUuid;

  void play(AudioResource source) {
    if (_isPlaying) {
      _player.pause();
    }

    if (source is RadioStation) {
      // debugPrint('source:$source');
      try {
        _player.setSourceUrl(source.url);
        _player.resume();
        _isPlaying = true;
        _sourceUuid = source.uuid;
      } catch (e) {
        debugPrint(e.toString());
        _player.resume();
        _isPlaying = true;
      }
    }
    notifyListeners();
  }

  void pause() {
    _player.pause();
    _isPlaying = false;
    notifyListeners();
  }

  bool isPlaying(AudioResource source) {
    // if (_player.playing && source.uuid == _sourceUuid) {
    if (_isPlaying && source.uuid == _sourceUuid) {
      return true;
    }
    return false;
  }
}
