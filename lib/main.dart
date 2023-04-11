import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kantoapp/firebase_options.dart';
import 'package:provider/provider.dart';

import 'logic/audio.dart';
import 'logic/player.dart';
import 'page/home/home.dart';
import 'settings/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // name: 'kantoapp',
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (useEmulator) {
    FirebaseFunctions.instance.useFunctionsEmulator('localhost', 5001);
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PlayerLogic()),
        ChangeNotifierProvider(create: (_) => AudioLogic()),
      ],
      child: MaterialApp(
        title: 'Kanto',
        theme: ThemeData(
          colorSchemeSeed: Colors.orangeAccent,
          brightness: Brightness.dark,
          floatingActionButtonTheme: const FloatingActionButtonThemeData()
              .copyWith(
                  backgroundColor: const Color.fromARGB(50, 248, 104, 60)),
          useMaterial3: true,
        ),
        home: const HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
