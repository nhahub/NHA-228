import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerField extends StatefulWidget {
  const ImagePickerField({super.key});

  @override
  State<ImagePickerField> createState() => _ImagePickerFieldState();
}

class _ImagePickerFieldState extends State<ImagePickerField> {
  File? selectedImage;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() => selectedImage = File(picked.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Add a photo (optional)",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: pickImage,
          child: Container(
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child:
                selectedImage == null
                    ? const Center(
                      child: Icon(
                        Icons.add_a_photo_outlined,
                        size: 40,
                        color: Colors.grey,
                      ),
                    )
                    : ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.file(
                        selectedImage!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
          ),
        ),
      ],
    );
  }
}
