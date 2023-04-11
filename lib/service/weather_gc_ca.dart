import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/foundation.dart';
import 'package:xml/xml.dart';

import '../model/weather.dart';
import 'weather_sample_xml.dart';

Future<WeatherData?> getWeatherData() async {
  // final xmlDoc = XmlDocument.parse(sampleXml);

  /*
  */
  final functions = FirebaseFunctions.instance;
  final res = await functions.httpsCallable('getWeatherData').call(
    {'site': 's0000430'},
  );
  late XmlDocument xmlDoc;

  try {
    xmlDoc = XmlDocument.parse(res.data['weather']);
  } catch (err) {
    return null;
  }

  // siteData
  final siteData = xmlDoc.getElement('siteData');
  if (siteData == null) {
    debugPrint('getWeatherData:siteData not found');
    return null;
  }

  return WeatherData(
    location: _parseLocation(siteData),
    published: _parseDateTime(siteData),
    current: _parseCurrentConditions(siteData),
    warnings: _parseWarnings(siteData),
    daily: _parseForecastGroup(siteData),
    hourly: _parseHourlForecastGroup(siteData),
    sunrise: _parseDateTime(siteData.getElement('riseSet'), name: 'sunrise'),
    sunset: _parseDateTime(siteData.getElement('riseSet'), name: 'sunset'),
    almanac: _parseAlmanac(siteData),
  );
}

DateTime? _parseDateTime(XmlElement? elem, {String? name}) {
  final elemDateTime = name != null
      ? elem
          ?.findElements('dateTime')
          .where((e) => e.getAttribute('name') == name)
      : elem?.findElements('dateTime');
  if (elemDateTime != null && elemDateTime.isNotEmpty) {
    try {
      // get UTC timestamp
      final dt =
          elemDateTime.firstWhere((e) => e.getAttribute('zone') == 'UTC');
      final ts = dt.getElement('timeStamp')?.innerText;
      // parse timestamp
      return _getDateTimeFromString(ts);
    } catch (err) {
      debugPrint(err.toString());
    }
  }
  return null;
}

DateTime? _getDateTimeFromString(String? ts) {
  // some timestamp has no seconds
  if (ts is String && ts.length < 14) {
    ts = '${ts}00';
  }
  try {
    return DateTime.parse('${ts?.substring(0, 4)}-${ts?.substring(4, 6)}'
        '-${ts?.substring(6, 8)}T${ts?.substring(8, 10)}'
        ':${ts?.substring(10, 12)}:${ts?.substring(12, 14)}Z');
  } catch (e) {
    debugPrint(e.toString());
  }
  return null;
}

Location? _parseLocation(XmlElement? elem) {
  final elemLoc = elem?.getElement('location');

  return elemLoc != null
      ? Location(
          country: elemLoc.getElement('country')?.innerText,
          province: elemLoc.getElement('province')?.innerText,
          name: elemLoc.getElement('name')?.innerText,
          code: elemLoc.getElement('name')?.getAttribute('code'),
          lat: elemLoc.getElement('name')?.getAttribute('lat'),
          lon: elemLoc.getElement('name')?.getAttribute('lon'),
          region: elemLoc.getElement('region')?.innerText,
        )
      : null;
}

WeatherAlert? _parseWarnings(XmlElement? elem) {
  final elemWarn = elem?.getElement('warnings');

  // FIXME: do something
  return elemWarn != null ? WeatherAlert() : null;
}

CurrentConditions? _parseCurrentConditions(XmlElement? elem) {
  final elemCurr = elem?.getElement('currentConditions');

  return elemCurr != null
      ? CurrentConditions(
          station: WeatherStation(
            name: elemCurr.getElement('station')?.innerText,
            code: elemCurr.getElement('station')?.getAttribute('code'),
            lat: elemCurr.getElement('station')?.getAttribute('lat'),
            lon: elemCurr.getElement('station')?.getAttribute('lon'),
          ),
          observation: _parseDateTime(elemCurr),
          condition: elemCurr.getElement('condition')?.innerText,
          iconCode: elemCurr.getElement('iconCode')?.innerText,
          temperature: _parseValueByTag(elemCurr, 'temperature'),
          dewpoint: _parseValueByTag(elemCurr, 'dewpoint'),
          windChill: _parseValueByTag(elemCurr, 'windChill'),
          pressure: _parseValueByTag(elemCurr, 'pressure'),
          visibility: _parseValueByTag(elemCurr, 'visibility'),
          relativeHumidity: _parseValueByTag(elemCurr, 'relativeHumidity'),
          wind: _parseWindData(elemCurr.getElement('wind')),
        )
      : null;
}

Forecast? _parseForecastGroup(XmlElement? elem) {
  final elemFg = elem?.getElement('forecastGroup');

  return elemFg != null
      ? Forecast(
          issued: _parseDateTime(elemFg),
          forecasts: _parseForecastEntries(elemFg),
        )
      : null;
}

List<ForecastEntry> _parseForecastEntries(XmlElement? elem) {
  final elems = elem?.findElements('forecast');
  final result = <ForecastEntry>[];

  if (elems != null && elems.isNotEmpty) {
    for (final elem in elems) {
      result.add(ForecastEntry(
        period: elem.getElement('period')?.innerText,
        summary: ForecastSummary(
          all: elem.getElement('textSummary')?.innerText,
          cloud: elem
              .getElement('cloudPrecip')
              ?.getElement('textSummary')
              ?.innerText,
          temperature: elem
              .getElement('temperatures')
              ?.getElement('textSummary')
              ?.innerText,
          winds: elem.getElement('winds')?.getElement('textSummary')?.innerText,
          precip: elem
              .getElement('precipitation')
              ?.getElement('textSummary')
              ?.innerText,
          windChill: elem
              .getElement('windChill')
              ?.getElement('textSummary')
              ?.innerText,
          frost: elem.getElement('frost')?.getElement('textSummary')?.innerText,
          uv: elem.getElement('uv')?.getElement('textSummary')?.innerText,
        ),
        iconCode: elem
            .getElement('abbreviatedForecast')
            ?.getElement('iconCode')
            ?.innerText,
        temperatures: elem
            .getElement('temperatures')
            ?.findElements('temperature')
            .map((e) => double.tryParse(e.innerText))
            .toList(),
        winds: elem
            .getElement('winds')
            ?.findElements('wind')
            .map((e) => _parseWindData(e))
            .toList(),
        precip: PrecipData(
          summary: elem
              .getElement('precipitation')
              ?.getElement('textSummary')
              ?.innerText,
          start: elem
              .getElement('precipitation')
              ?.getElement('precipType')
              ?.getAttribute('start'),
          end: elem
              .getElement('precipitation')
              ?.getElement('precipType')
              ?.getAttribute('end'),
          text: elem
              .getElement('precipitation')
              ?.getElement('precipType')
              ?.innerText,
        ),
        windChill:
            elem.getElement('windChill')?.getElement('calculated')?.innerText !=
                    null
                ? double.tryParse((elem
                    .getElement('windChill')
                    ?.getElement('calculated')
                    ?.innerText)!)
                : null,
        uvIndex: elem.getElement('uv')?.getElement('index')?.innerText != null
            ? double.tryParse(
                (elem.getElement('uv')?.getElement('index')?.innerText)!)
            : null,
        relativeHumidity: elem.getElement('relativeHumidity')?.innerText != null
            ? double.tryParse((elem.getElement('relativeHumidity')?.innerText)!)
            : null,
        humidex: null, // TODO
        frost: null, // TODO
      ));
    }
  }
  return result;
}

HourlyForecast? _parseHourlForecastGroup(XmlElement? elem) {
  final elemFg = elem?.getElement('hourlyForecastGroup');

  return elemFg != null
      ? HourlyForecast(
          issued: _parseDateTime(elemFg),
          forecasts: _parseHourlyForecastEntries(elemFg))
      : null;
}

List<HourlyForecastEntry> _parseHourlyForecastEntries(XmlElement? elem) {
  final elems = elem?.findElements('hourlyForecast');
  final result = <HourlyForecastEntry>[];

  if (elems != null && elems.isNotEmpty) {
    for (final elem in elems) {
      result.add(HourlyForecastEntry(
          time: _getDateTimeFromString(elem.getAttribute('dateTimeUTC')),
          condition: elem.getElement('condition')?.innerText,
          iconCode: elem.getElement('iconCode')?.innerText,
          temperature: elem.getElement('temperature')?.innerText != null
              ? double.tryParse((elem.getElement('temperature')?.innerText)!)
              : null,
          lop: elem.getElement('lop')?.innerText != null
              ? double.tryParse((elem.getElement('lop')?.innerText)!)
              : null,
          windChill: elem.getElement('windChill')?.innerText != null
              ? double.tryParse((elem.getElement('windChill')?.innerText)!)
              : null,
          humidex: elem.getElement('humidex')?.innerText != null
              ? double.tryParse((elem.getElement('humidex')?.innerText)!)
              : null,
          wind: _parseWindData(elem.getElement('wind'))));
    }
  }

  return result;
}

Almanac? _parseAlmanac(XmlElement? elem) {
  final elemAlm = elem?.getElement('almanac');
  if (elemAlm == null) {
    return null;
  }

  double? tempAvgHigh, tempAvgLow;
  HistoricRecord? tempExtHigh, tempExtLow;
  HistoricRecord? precipExt, rainfallExt, snowfallExt;

  for (final elemTemp in elemAlm.findElements('temperature')) {
    if (elemTemp.getAttribute('class') == 'extremeMax') {
      tempExtHigh = HistoricRecord(
        value: double.tryParse(elemTemp.innerText),
        year: elemTemp.getAttribute('year') != null
            ? int.tryParse((elemTemp.getAttribute('year'))!)
            : null,
      );
    } else if (elemTemp.getAttribute('class') == 'extremeMin') {
      tempExtLow = HistoricRecord(
        value: double.tryParse(elemTemp.innerText),
        year: elemTemp.getAttribute('year') != null
            ? int.tryParse((elemTemp.getAttribute('year'))!)
            : null,
      );
    } else if (elemTemp.getAttribute('class') == 'normalMax') {
      tempAvgHigh = double.tryParse(elemTemp.innerText);
    } else if (elemTemp.getAttribute('class') == 'normalMin') {
      tempAvgLow = double.tryParse(elemTemp.innerText);
    }
  }

  for (final elemPrecip in elemAlm.findElements('precipitation')) {
    if (elemPrecip.getAttribute('class') == 'extremeRainfall') {
      rainfallExt = HistoricRecord(
        value: double.tryParse(elemPrecip.innerText),
        year: elemPrecip.getAttribute('year') != null
            ? int.tryParse((elemPrecip.getAttribute('year'))!)
            : null,
      );
    } else if (elemPrecip.getAttribute('class') == 'extremeSnowfall') {
      snowfallExt = HistoricRecord(
        value: double.tryParse(elemPrecip.innerText),
        year: elemPrecip.getAttribute('year') != null
            ? int.tryParse((elemPrecip.getAttribute('year'))!)
            : null,
      );
    } else if (elemPrecip.getAttribute('class') == 'extremePrecipitation') {
      precipExt = HistoricRecord(
        value: double.tryParse(elemPrecip.innerText),
        year: elemPrecip.getAttribute('year') != null
            ? int.tryParse((elemPrecip.getAttribute('year'))!)
            : null,
      );
    }
  }

  return Almanac(
    tempAvgHigh: tempAvgHigh,
    tempAvgLow: tempAvgLow,
    tempExtHigh: tempExtHigh,
    tempExtLow: tempExtLow,
    precipExt: precipExt,
    rainfallExt: rainfallExt,
    snowfallExt: snowfallExt,
    monthlyAvgPoP: elemAlm.getElement('pop')?.innerText != null
        ? double.tryParse((elemAlm.getElement('pop')?.innerText)!)
        : null,
  );
}

double? _parseValueByTag(XmlElement? elem, String tag) {
  return elem?.getElement(tag)?.innerText != null
      ? double.tryParse((elem?.getElement(tag)?.innerText)!)
      : null;
}

WindData? _parseWindData(XmlElement? elem) {
  return WindData(
    speed: _parseValueByTag(elem, 'speed'),
    gust: _parseValueByTag(elem, 'speed'),
    direction: elem?.getElement('direction')?.innerText,
    bearing: _parseValueByTag(elem, 'bearing'),
  );
}
