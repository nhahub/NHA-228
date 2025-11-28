import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:nha_228/core/core.dart';

class SmartImage extends StatelessWidget {
  final String? imageUrlOrPath;
  final BoxFit fit;

  const SmartImage({super.key, this.imageUrlOrPath, this.fit = BoxFit.cover});

  Widget _placeholder() {
    return Container(
      color: AppColors.categoryBackground,
      child: Center(
        child: Icon(
          Icons.image_outlined,
          size: AppSizes.h60,
          color: AppColors.secondary.withValues(alpha: 0.5),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final s = imageUrlOrPath;
    if (s == null || s.trim().isEmpty) return _placeholder();
    final trimmed = s.trim();

    // network
    if (trimmed.startsWith('http://') || trimmed.startsWith('https://')) {
      return Image.network(
        trimmed,
        fit: fit,
        errorBuilder: (_, __, ___) => _placeholder(),
      );
    }

    if (trimmed.startsWith('file://') || trimmed.startsWith('/')) {
      if (kIsWeb) return _placeholder();
      try {
        final path =
            trimmed.startsWith('file://') ? Uri.parse(trimmed).toFilePath() : trimmed;
        final file = File(path);
        if (file.existsSync()) {
          return Image.file(file, fit: fit);
        }
        return _placeholder();
      } catch (_) {
        return _placeholder();
      }
    }

    return Image.asset(trimmed, fit: fit, errorBuilder: (_, __, ___) => _placeholder());
  }
}
