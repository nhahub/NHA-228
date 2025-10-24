import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nha_228/core/constants/app_assets.dart';

ImageProvider getUserImage(String? photoUrl) {
  if (photoUrl == null || photoUrl.isEmpty) {
    return const AssetImage(AppAssets.profile);
  }
  if (photoUrl.startsWith('http')) {
    return NetworkImage(photoUrl);
  }
  final file = File(photoUrl);
  if (file.existsSync()) {
    return FileImage(file);
  }
  return const AssetImage(AppAssets.profile);
}
