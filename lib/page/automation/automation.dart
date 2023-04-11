import 'package:flutter/material.dart';

class AutomationPage extends StatefulWidget {
  const AutomationPage({super.key});

  @override
  State<AutomationPage> createState() => _AutomationPageState();
}

class _AutomationPageState extends State<AutomationPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(),
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
