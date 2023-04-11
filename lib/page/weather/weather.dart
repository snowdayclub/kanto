import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kantoapp/service/weather_gc_ca.dart';

import '../../model/weather.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  //
  // Hourly Forecast
  //
  Widget buildHourlyForecast(List<HourlyForecastEntry>? forecasts) {
    return SizedBox(
      height: 90,
      // https://stackoverflow.com/questions/69232764/flutter-web-cannot-scroll-with-mouse-down-drag-flutter-2-5
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
          },
        ),
        child: ListView.builder(
          // shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: forecasts?.length,
          itemExtent: 70.0,
          itemBuilder: (context, index) => Column(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${forecasts?[index].time?.toLocal().hour}'),
              const SizedBox(height: 8),
              Image.asset(
                'assets/images/${forecasts?[index].iconCode}.png',
                width: 24.0,
                height: 24.0,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 8),
              Text('${forecasts?[index].temperature} \u2103'),
            ],
          ),
        ),
      ),
    );
  }

  //
  // Daily Forecast
  //
  Widget buildDailyForecast(List<ForecastEntry>? forecasts) {
    return ListView.builder(
      shrinkWrap: true,
      // physics: const NeverScrollableScrollPhysics(),
      // scrollDirection: Axis.vertical,
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      itemCount: forecasts?.length,
      itemBuilder: (context, index) => Row(
        children: [
          Text(
            '${forecasts?[index].period}',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(
            width: 10.0,
            height: 40.0,
          ),
          Image.asset(
            'assets/images/${forecasts?[index].iconCode}.png',
            width: 24,
            height: 24,
            fit: BoxFit.fill,
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: Text(
              '${forecasts?[index].summary?.all}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBody(WeatherData? data) {
    // debugPrint('data:$data');
    const textStyle1 = TextStyle(fontSize: 22.0);
    final textStyle2 = TextStyle(
      fontSize: 16.0,
      color: Theme.of(context).colorScheme.secondary,
    );
    return data != null
        ? SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              // ? Column(
              children: [
                //
                // Location
                //
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // region
                    Text(
                      '${data.location?.region}',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                    ),
                    // published
                    TextButton(
                      onPressed: () => setState(() {}),
                      child: Text(
                          'update ${data.published?.toLocal().toString().split(' ')[1].replaceFirst('.000', '')}'),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                //
                // Current Condition
                //
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // current weather icon
                        Image.asset(
                          'assets/images/${data.current?.iconCode}.png',
                          // width: 48,
                          // height: 48,
                          // fit: BoxFit.fill,
                        ),
                        Text(
                          '${data.current?.temperature} \u2103 ',
                          style: textStyle2,
                        )
                      ],
                    ),
                    const SizedBox(width: 48.0),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // condition
                        Text('${data.current?.condition}', style: textStyle1),
                        // humidity
                        Text('Humidity ${data.current?.relativeHumidity}%',
                            style: textStyle2),
                        // wind
                        Text(
                            'Wind ${data.current?.wind?.speed} km '
                            '${data.current?.wind?.direction}',
                            style: textStyle2),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                //
                // Hourly Forecast
                //
                buildHourlyForecast(data.hourly?.forecasts),
                //
                const SizedBox(height: 20.0),
                // Daily Forecast
                buildDailyForecast(data.daily?.forecasts),
              ],
            ),
          )
        : const Center(
            child: Text('Failed to get weather data'),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FutureBuilder<WeatherData?>(
            future: getWeatherData(),
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? buildBody(snapshot.data)
                  : const Center(
                      child: SizedBox(
                        width: 30.0,
                        height: 30.0,
                        child: CircularProgressIndicator(),
                      ),
                    );
            }),
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
