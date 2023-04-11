class Location {
  final String? country;
  final String? province;
  final String? name;
  final String? code;
  final String? lat;
  final String? lon;
  final String? region;

  Location({
    this.country,
    this.province,
    this.name,
    this.code,
    this.lat,
    this.lon,
    this.region,
  });

  @override
  String toString() {
    return {
      'country': country,
      'province': province,
      'name': name,
      'code': code,
      'lat': lat,
      'lon': lon,
      'region': region,
    }.toString();
  }
}

class WeatherAlert {
  final String? title;
  final String? link;
  final DateTime? published;
  final String? category;
  final String? summary;

  WeatherAlert({
    this.title,
    this.link,
    this.published,
    this.category,
    this.summary,
  });

  @override
  String toString() {
    return {
      'title': title,
      'link': link,
      'published': published,
      'category': category,
      'summary': summary,
    }.toString();
  }
}

class CurrentConditions {
  final WeatherStation? station;
  final DateTime? observation;
  final String? condition;
  final String? iconCode;
  final double? temperature;
  final double? dewpoint;
  final double? windChill;
  final double? pressure;
  final double? visibility;
  final double? relativeHumidity;
  final WindData? wind;

  CurrentConditions({
    this.station,
    this.observation,
    this.condition,
    this.iconCode,
    this.temperature,
    this.dewpoint,
    this.windChill,
    this.pressure,
    this.visibility,
    this.relativeHumidity,
    this.wind,
  });

  @override
  String toString() {
    return {
      'station': station,
      'observation': observation,
      'condition': condition,
      'iconCode': iconCode,
      'temperature': temperature,
      'dewpoint': dewpoint,
      'windChill': windChill,
      'pressure': pressure,
      'visibility': visibility,
      'relativeHumidity': relativeHumidity,
      'wind': wind,
    }.toString();
  }
}

class Forecast {
  final DateTime? issued;
  final List<ForecastEntry>? forecasts;

  Forecast({
    this.issued,
    this.forecasts,
  });

  @override
  String toString() {
    return {
      'issued': issued,
      'forecasts': forecasts,
    }.toString();
  }
}

class ForecastEntry {
  final String? period;
  final ForecastSummary? summary;
  final String? iconCode;
  final List<double?>? temperatures;
  final List<WindData?>? winds;
  final PrecipData? precip;
  final double? windChill;
  final double? uvIndex;
  final double? relativeHumidity;
  final double? humidex;
  final String? frost;

  ForecastEntry({
    this.period,
    this.summary,
    this.iconCode,
    this.temperatures,
    this.winds,
    this.precip,
    this.windChill,
    this.uvIndex,
    this.relativeHumidity,
    this.humidex,
    this.frost,
  });

  @override
  String toString() {
    return {
      'period': period,
      'summary': summary,
      'iconCode': iconCode,
      'temperatures': temperatures,
      'winds': winds,
      'precip': precip,
      'windChill': windChill,
      'uvIndex': uvIndex,
      'relativeHumidity': relativeHumidity,
      'humidex': humidex,
      'frost': frost,
    }.toString();
  }
}

class ForecastSummary {
  final String? all;
  final String? cloud;
  final String? temperature;
  final String? winds;
  final String? precip;
  final String? windChill;
  final String? frost;
  final String? uv;

  ForecastSummary({
    this.all,
    this.cloud,
    this.temperature,
    this.winds,
    this.precip,
    this.windChill,
    this.frost,
    this.uv,
  });

  @override
  String toString() {
    return {
      'all': all,
      'cloud': cloud,
      'temperature': temperature,
      'winds': winds,
      'precip': precip,
      'windChill': windChill,
      'frost': frost,
      'uv': uv,
    }.toString();
  }
}

class HourlyForecast {
  final DateTime? issued;
  final List<HourlyForecastEntry>? forecasts;

  HourlyForecast({
    this.issued,
    this.forecasts,
  });

  @override
  String toString() {
    return {
      'issued': issued,
      'forecasts': forecasts,
    }.toString();
  }
}

class HourlyForecastEntry {
  final DateTime? time;
  final String? condition;
  final String? iconCode;
  final double? temperature;
  final double? lop;
  final double? windChill;
  final double? humidex;
  final WindData? wind;

  HourlyForecastEntry({
    this.time,
    this.condition,
    this.iconCode,
    this.temperature,
    this.lop,
    this.windChill,
    this.humidex,
    this.wind,
  });

  @override
  String toString() {
    return {
      'time': time,
      'condition': condition,
      'iconCode': iconCode,
      'temperature': temperature,
      'lop': lop,
      'windChill': windChill,
      'humidex': humidex,
      'wind': wind,
    }.toString();
  }
}

class WeatherStation {
  final String? name;
  final String? code;
  final String? lat;
  final String? lon;

  WeatherStation({
    this.name,
    this.code,
    this.lat,
    this.lon,
  });

  @override
  String toString() {
    return {
      'name': name,
      'code': code,
      'lat': lat,
      'lon': lon,
    }.toString();
  }
}

class WindData {
  final double? speed;
  final double? gust;
  final String? direction;
  final double? bearing;

  WindData({
    this.speed,
    this.gust,
    this.direction,
    this.bearing,
  });

  @override
  String toString() {
    return {
      'speed': speed,
      'gust': gust,
      'direction': direction,
      'bearing': bearing,
    }.toString();
  }
}

class PrecipData {
  final String? summary;
  final String? start;
  final String? end;
  final String? text;

  PrecipData({
    this.summary,
    this.start,
    this.end,
    this.text,
  });

  @override
  String toString() {
    return {
      'summary': summary,
      'start': start,
      'end': end,
      'text': text,
    }.toString();
  }
}

class Almanac {
  final double? tempAvgHigh;
  final double? tempAvgLow;
  final HistoricRecord? tempExtHigh;
  final HistoricRecord? tempExtLow;
  final HistoricRecord? precipExt;
  final HistoricRecord? rainfallExt;
  final HistoricRecord? snowfallExt;
  final double? monthlyAvgPoP;

  Almanac({
    this.tempAvgHigh,
    this.tempAvgLow,
    this.tempExtHigh,
    this.tempExtLow,
    this.precipExt,
    this.rainfallExt,
    this.snowfallExt,
    this.monthlyAvgPoP,
  });

  @override
  String toString() {
    return {
      'tempAvgHigh': tempAvgHigh,
      'tempAvgLow': tempAvgLow,
      'temExtHigh': tempExtHigh,
      'tempExtLow': tempExtLow,
      'precipExt': precipExt,
      'rainfallExt': rainfallExt,
      'snowfallExt': snowfallExt,
      'monthlyAvgPoP': monthlyAvgPoP,
    }.toString();
  }
}

class HistoricRecord {
  final double? value;
  final int? year;

  HistoricRecord({this.value, this.year});

  @override
  String toString() {
    return {'value': value, 'year': year}.toString();
  }
}

class WeatherData {
  final Location? location;
  final DateTime? published;
  final CurrentConditions? current;
  final WeatherAlert? warnings;
  final Forecast? daily;
  final HourlyForecast? hourly;
  final Almanac? almanac;
  final DateTime? sunrise;
  final DateTime? sunset;

  WeatherData({
    this.location,
    this.published,
    this.current,
    this.warnings,
    this.daily,
    this.hourly,
    this.almanac,
    this.sunrise,
    this.sunset,
  });

  @override
  String toString() {
    return {
      'location': location,
      'published': published,
      'current': current,
      'warnings': warnings,
      'daily': daily,
      'hourly': hourly,
      'almanac': almanac,
      'sunrise': sunrise,
      'sunset': sunset,
    }.toString();
  }
}
