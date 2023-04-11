import 'package:flutter/foundation.dart';

import '../model/audio.dart';
import '../service/radio_browser.dart';

class AudioLogic extends ChangeNotifier {
  final _sources = <AudioResource>[];

  AudioLogic() {
    getSampleSources();
  }

  Future getSampleSources() async {
    // final radioStations = await getTopClickStations(count: 5);
    final radioStations = await getRadioStations();
    // radioStations.map().toList();
    for (final station in radioStations) {
      // debugPrint('station:$station');
      _sources.add(station);
      _sources.sort((a, b) => a.name.compareTo(b.name));
    }
    notifyListeners();
  }

  List<AudioResource> get sources => _sources;

  Future delete(AudioResource source) async {
    _sources.removeWhere((element) => element.uuid == source.uuid);
    notifyListeners();
  }

  Future addStation() async {}
  Future getStation() async {}
  Future updateStation() async {}
  Future deleteStation() async {}
}
