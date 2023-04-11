import 'dart:convert';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../model/radio.dart';

const hostUrl = 'http://all.api.radio-browser.info';
const stationsApiUrl = '$hostUrl/json/stations/';

const uuidMango = '78012206-1aa1-11e9-a80b-52543be04c81';
const uuidRadioParadise = '9617a958-0601-11e8-ae97-52543be04c81';
const uuidRadioClassique = '265a40b6-8e96-4102-8ea7-26d162f970ca';
const uuidHot899Ottawa = '0c8e3629-39c2-4d22-9fcf-bf8353e13584';
const uuidKissFmOttawa = 'c67ced28-65c3-4cbe-8959-65901b72689c';
const uuidAlgColOttawa = '9618998a-0601-11e8-ae97-52543be04c81';
const uuidBoom997Ottawa = '96215869-0601-11e8-ae97-52543be04c81';
const uuidAsmrDaySpa = '061f0aa7-5a96-4d44-80bb-c687dbbfbc89';
const uuidRadioWhisper = 'edc7f47c-284b-4072-a055-a696bacd184e';
const uuid3MusicRadio = '0835df24-5aa3-40f4-9a19-9298aadbdebb';
const uuidChrisTDLRadio = 'f5048c0f-7021-4d67-95dc-ab3108d7b0d7';
const uuidAsmrOnLgbt = 'fc36735b-eaa2-42fc-8b5e-a9715c0a6a0d';
const uuidAmbientSp = '51be46a5-0a77-4772-84f8-3a5b373b07ca';
const uuidAmbientFm = '44b7f191-9478-46b0-a3b5-5a0ea2b2d64e';
const uuidEpicClassical = 'b26c3de7-c2ca-4595-95b7-af9f42db3f75';
const uuidFluxFm = '9645921d-0601-11e8-ae97-52543be04c81';
const uuidKlassikRadioHealing = '9625fcf2-0601-11e8-ae97-52543be04c81';
const uuidRadioArtAncient = 'b774c7f9-ca9e-4c59-b01c-2f182290c9db';
const uuidRadioArtChant = 'dd5d80a0-576e-4b7a-86db-118a3c9f0bf1';
const uuidRadioArtInsomnia = 'fb7bdd90-fe04-4b66-bc37-66e31b0ef41b';
const uuidRadioArtMantras = '68843797-7947-4b62-a8cb-568bef2646cf';
const uuidRadioCapriceMeditation = 'bebfa334-df6f-11e9-a8ba-52543be04c81';
const uuidRadioNature = 'bf5b804b-45ba-41ed-a1a7-41e0544e08e9';

const radioStationUuids = [
  uuidMango,
  uuidRadioParadise,
  uuidRadioClassique,
  uuidHot899Ottawa,
  uuidKissFmOttawa,
  uuidAlgColOttawa,
  uuidBoom997Ottawa,
  uuidAsmrDaySpa,
  // uuidRadioWhisper,
  // uuidChrisTDLRadio,
  // uuidAsmrOnLgbt,
  uuidAmbientSp,
  uuidAmbientFm,
  uuidEpicClassical,
  uuidFluxFm,
  uuidKlassikRadioHealing,
  // uuidRadioArtAncient,
  // uuidRadioArtChant,
  // uuidRadioArtInsomnia,
  // uuidRadioArtMantras,
  uuidRadioCapriceMeditation,
  uuidRadioNature,
];

// works only locally
Future<List<RadioStation>> getTopClickStations({int count = 100}) async {
  final stations = <RadioStation>[];

  final res = await http.get(Uri.parse('$stationsApiUrl/topclick/$count'));
  if (res.statusCode == 200) {
    final data = json.decode(res.body);
    if (data is List) {
      for (final item in data) {
        stations.add(RadioStation.fromJson(item));
      }
    }
  }

  return stations;
}

final functions = FirebaseFunctions.instance;

Future<List<RadioStation>> getRadioStations() async {
  final stations = <RadioStation>[];

  try {
    final res = await functions.httpsCallable('getStationsByUuid').call(
      {'uuids': radioStationUuids},
    );
    final stationData = res.data['stations'];
    if (stationData is List) {
      for (final item in stationData) {
        stations.add(RadioStation.fromJson(item as Map<String, dynamic>));
      }
    }
  } on FirebaseFunctionsException catch (err) {
    debugPrint(err.message);
  }
  return stations;

  // try {
  //   final res = await functions.httpsCallable('getTopClickStations').call(
  //     {'count': 10},
  //   );
  //   final stationData = res.data['stations'];
  //   if (stationData is List) {
  //     for (final item in stationData) {
  //       stations.add(RadioStation.fromJson(item as Map<String, dynamic>));
  //     }
  //   }
  // } on FirebaseFunctionsException catch (err) {
  //   debugPrint(err.message);
  // }
  // return stations;

  // return await getTopClickStations(count: 12);

  // const url = 'https://us-central1-kanto-d580e.cloudfunctions.net/'
  //     'radioBrowserProxy/topclick/15';
  // final res = await http.get(Uri.parse(url));
  // if (res.statusCode == 200) {
  //   // debugPrint('res.body:${res.body}');
  //   final data = json.decode(res.body);
  //   if (data is List) {
  //     for (final item in data) {
  //       stations.add(RadioStation.fromJson(item));
  //     }
  //   }
  // }
  // return stations;
}
