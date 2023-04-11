import 'dart:async';

import 'package:flutter/material.dart';

class ClockPage extends StatefulWidget {
  const ClockPage({super.key});

  @override
  State<ClockPage> createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  late final Timer _timer;
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) => setState(() {}),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const hourStyle = TextStyle(
      color: Colors.lightGreenAccent,
      fontFamily: 'DSEG14 Classic',
      fontSize: 150.0,
      fontWeight: FontWeight.w900,
      fontStyle: FontStyle.italic,
    );
    const secStyle = TextStyle(
      color: Colors.blueAccent,
      fontFamily: 'DSEG14 Classic',
      fontSize: 80.0,
      fontWeight: FontWeight.w900,
      fontStyle: FontStyle.italic,
    );
    const dateStyle = TextStyle(
      color: Colors.redAccent,
      fontFamily: 'DSEG14 Classic',
      fontSize: 50.0,
      fontWeight: FontWeight.w900,
      fontStyle: FontStyle.italic,
    );
    final times = DateTime.now().toString().split(' ');
    final date = times[0].trim();
    // final time = times[1];
    final time = times[1].trim().split(':');
    final hourMin = "${time[0]}:${time[1]}";
    final sec = time[2].split('.')[0];
    return Stack(
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(hourMin, style: hourStyle),
                  Text(sec, style: secStyle),
                ],
              ),
              Text(
                date,
                style: dateStyle,
              ),
            ],
          ),
        ),
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
