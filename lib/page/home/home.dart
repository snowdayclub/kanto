import 'package:flutter/material.dart';

import '../../service/utils.dart';
import '../audio/audio.dart';
import '../automation/automation.dart';
import '../clock/clock.dart';
import '../photo/photo.dart';
import '../weather/weather.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  Widget _buildSideNavBar() {
    final iconColor = Theme.of(context).colorScheme.primary;
    final selectedColor = Colors.grey[800];

    return NavigationRail(
      backgroundColor: Colors.transparent,
      elevation: 4,
      selectedIndex: _selectedIndex,
      useIndicator: true,
      indicatorColor: iconColor,
      onDestinationSelected: (int index) {
        _selectedIndex = index;
        setState(() {});
      },
      labelType: NavigationRailLabelType.none,
      trailing: IconButton(
        icon: Icon(Icons.person_rounded,
            color: Theme.of(context).colorScheme.tertiary),
        onPressed: () async {
          // getRadioStations();
          // final weather = await getWeatherData();
          // debugPrint('weather: $weather');
        },
      ),
      destinations: <NavigationRailDestination>[
        NavigationRailDestination(
          icon: Icon(Icons.radio, color: iconColor),
          selectedIcon: Icon(Icons.radio, color: selectedColor),
          label: const Text('Music'),
          padding: const EdgeInsets.symmetric(vertical: 12.0),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.schedule_rounded, color: iconColor),
          selectedIcon: Icon(Icons.schedule_rounded, color: selectedColor),
          label: const Text('Clock'),
          padding: const EdgeInsets.symmetric(vertical: 12.0),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.thunderstorm_rounded, color: iconColor),
          selectedIcon: Icon(Icons.thunderstorm_rounded, color: selectedColor),
          label: const Text('Weather'),
          padding: const EdgeInsets.symmetric(vertical: 12.0),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.image_rounded, color: iconColor),
          selectedIcon: Icon(Icons.image_rounded, color: selectedColor),
          label: const Text('Photo Album'),
          padding: const EdgeInsets.symmetric(vertical: 12.0),
        ),
        // NavigationRailDestination(
        //   icon: Icon(Icons.home_work_rounded, color: iconColor),
        //   selectedIcon: Icon(Icons.home_work_rounded, color: selectedColor),
        //   label: const Text('Automation'),
        //   padding: const EdgeInsets.symmetric(vertical: 12.0),
        // ),
      ],
    );
  }

  Widget _getSelectedPage() {
    switch (_selectedIndex) {
      case 0: // Radio
        return const AudioPage();
      case 1: // Clock
        return const ClockPage();
      case 2: // Weather
        return const WeatherPage();
      case 3: // Photo
        return const PhotoPage();
      case 4: // Photo
        return const AutomationPage();
      default:
        return Container();
    }
  }

  Widget _buildContent() {
    return Expanded(
      child: _getSelectedPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // background image
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            opacity: _selectedIndex == 3 ? 1.0 : 0.35,
            image: AssetImage(assetPath('images/annie-spratt-cropped.jpg')),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          children: [
            // side navbar
            _buildSideNavBar(),
            _buildContent(),
          ],
        ),
      ),
    );
  }
}
