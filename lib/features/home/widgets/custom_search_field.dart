import 'package:flutter/material.dart';

class CustomSearchfield extends StatelessWidget {
  final String hintText;
  final void Function(String)? onSubmitted;
  final TextEditingController? controller;

  const CustomSearchfield({
    super.key,
    required this.hintText,
    this.onSubmitted,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: const Icon(Icons.search),
      ),
    );
  }
}
