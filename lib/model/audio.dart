import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../service/utils.dart';

enum ResourceType { radio, podcast }

class AudioResource {
  UuidValue uuid;
  String name;
  ResourceType type;
  String url;
  String tags;
  String imageUrl;

  AudioResource({
    required this.uuid,
    required this.name,
    required this.type,
    required this.url,
    required this.tags,
    required this.imageUrl,
  });

  getImage() {
    return imageUrl.isEmpty ? getDefaultImage() : NetworkImage(imageUrl);
  }

  getDefaultImage() {
    return AssetImage(assetPath('images/singer.png'));
  }

  getShortName() {
    return name.replaceFirst(RegExp(r'(\(|\[).*'), '').trim();
  }
}
