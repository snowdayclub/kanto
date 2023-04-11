import 'package:flutter/foundation.dart';

// https://stackoverflow.com/questions/61301598/how-can-i-display-asset-images-on-flutter-web
String assetPath(path) {
  return (kIsWeb) ? 'assets/$path' : path;
}
