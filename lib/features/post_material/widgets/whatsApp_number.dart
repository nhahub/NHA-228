import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/post_material_cubit.dart';

class PhoneNumberField extends StatelessWidget {
  const PhoneNumberField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostMaterialCubit, PostMaterialState>(
      builder: (context, state) {
        return TextFormField(
          keyboardType: TextInputType.phone,
          decoration: const InputDecoration(
            labelText: "WhatsApp Number",
            hintText: "Enter your WhatsApp number",
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {
            context.read<PostMaterialCubit>().setPhoneNumber(value);
          },
        );
      },
    );
  }
}
