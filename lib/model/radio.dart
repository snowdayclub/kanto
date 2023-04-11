import 'package:uuid/uuid.dart';

import 'audio.dart';

class RadioStation extends AudioResource {
  String homepage;
  String countryCode;
  String state;
  String languages;
  int votes;
  int bitrate;
  int clickCount;
  DateTime lastUpdate;
  DateTime lastCheck;
  bool hasExtendedInfo;

  RadioStation({
    required super.uuid,
    required super.name,
    required super.type,
    required super.url,
    required super.tags,
    required super.imageUrl,
    required this.homepage,
    required this.countryCode,
    required this.state,
    required this.languages,
    required this.votes,
    required this.bitrate,
    required this.clickCount,
    required this.lastUpdate,
    required this.lastCheck,
    required this.hasExtendedInfo,
  });

  factory RadioStation.fromJson(Map<String, dynamic> json) {
    return RadioStation(
      // will throw FormatException if not valid
      // https://pub.dev/documentation/uuid/latest/uuid/Uuid/isValidOrThrow.html
      uuid: UuidValue(json['stationuuid'] as String),
      name: json['name'] is String ? json['name'] as String : '',
      type: ResourceType.radio,
      url: json['url_resolved'] is String ? json['url_resolved'] as String : '',
      tags: json['tags'] is String ? json['tags'] as String : '',
      imageUrl: json['favicon'] is String ? json['favicon'] as String : '',
      homepage: json['homepage'] is String ? json['homepage'] as String : '',
      countryCode: json['countrycode'] is String ? json['tags'] as String : '',
      state: json['state'] is String ? json['state'] as String : '',
      languages: json['language'] is String ? json['language'] as String : '',
      votes: json['votes'] is int ? json['votes'] as int : 0,
      bitrate: json['bitrate'] is int ? json['bitrate'] as int : 0,
      clickCount: json['clickcount'] is int ? json['clickcount'] as int : 0,
      lastUpdate: DateTime.parse(json['lastchangetime_iso8601'] as String),
      lastCheck: DateTime.parse(json['lastcheckoktime_iso8601'] as String),
      hasExtendedInfo: json['has_extended_info'] is bool
          ? json['has_extended_info'] as bool
          : false,
    );
  }

  // factory RadioStation.fromSample() {
  //   return RadioStation(
  //     uuid: UuidValue('78012206-1aa1-11e9-a80b-52543be04c81'),
  //     name: 'MANGORADIO',
  //     url: 'https://mangoradio.stream.laut.fm/mangoradio?t302='
  //         '2023-03-29_06-55-35&uuid=de798f7f-b3d3-4e2e-80a8-67d6d5850f37',
  //     tags: 'mango,mangoradio,mongo,mongoradio,public radio,webradio',
  //     imageUrl: '',
  //     homepage: 'https://mngoradio.de',
  //     countryCode: 'DE',
  //     state: '',
  //     languages: 'german',
  //     votes: 589121,
  //     bitrate: 128,
  //     clickCount: 11182,
  //     lastUpdate: DateTime.parse('2022-10-02T08:23:14Z'),
  //     lastCheck: DateTime.parse('2023-03-29T05:02:52Z'),
  //     hasExtendedInfo: false,
  //   );
  // }

  @override
  String toString() {
    return {
      'uuid': uuid,
      'name': name,
      'type': type.name,
      'url': url,
      'tags': tags,
      'image': imageUrl,
      'homepage': homepage,
      'countryCode': countryCode,
      'state': state,
      'languages': languages,
      'votes': votes,
      'bitrate': bitrate,
      'clickCount': clickCount,
      'lastUpdate': lastUpdate.toIso8601String(),
      'lastCheck': lastCheck.toIso8601String(),
      'hasExtendedInfo': hasExtendedInfo,
    }.toString();
  }
}
