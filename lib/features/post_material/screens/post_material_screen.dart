import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nha_228/core/constants/app_colors.dart';
import 'package:nha_228/core/constants/app_sizes.dart';
import 'package:nha_228/core/constants/app_strings.dart';
import 'package:nha_228/core/widgets/custom_app_bar.dart';
import 'package:nha_228/features/post_material/cubit/post_material_cubit.dart';
import 'package:nha_228/features/post_material/widgets/date_and_time.dart';
import 'package:nha_228/features/post_material/widgets/description_field.dart';
import 'package:nha_228/features/post_material/widgets/image_picker_field.dart';
import 'package:nha_228/features/post_material/widgets/location_field.dart';
import 'package:nha_228/features/post_material/widgets/material_grid.dart';
import 'package:nha_228/features/post_material/widgets/quantity_selector.dart';
import 'package:nha_228/features/post_material/widgets/submit_button.dart';
import 'package:nha_228/features/post_material/widgets/whatsApp_number.dart';

class PostMaterialScreen extends StatelessWidget {
  PostMaterialScreen({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PostMaterialCubit(),
      child: Scaffold(
        backgroundColor: AppColors.primary,
        appBar: CustomAppBar(title: AppStrings.postingMaterials),
        body: Padding(
          padding: const EdgeInsets.all(16),
<<<<<<< HEAD
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const MaterialGrid(),
                SizedBox(height: AppSizes.h24),
                const QuantitySelector(),
                SizedBox(height: AppSizes.h24),
                const ImagePickerField(),
                SizedBox(height: AppSizes.h24),
                const DescriptionField(),
                SizedBox(height: AppSizes.h30),
                const LocationField(),
                SizedBox(height: AppSizes.h24),
                const DateAndTime(),
                SizedBox(height: AppSizes.h24),
                const WhatsappNumber(),
                SizedBox(height: AppSizes.h24),
                SubmitButton(formKey: formKey),
              ],
            ),
=======
          child: ListView(
            children: [
              MaterialGrid(),
              SizedBox(height: AppSizes.h24),
              QuantitySelector(),
              SizedBox(height: AppSizes.h24),
              ImagePickerField(),
              SizedBox(height: AppSizes.h24),
              DescriptionField(),
              SizedBox(height: AppSizes.h30),
              LocationField(),
              SizedBox(height: AppSizes.h24),
              DateAndTime(),
              SizedBox(height: AppSizes.h24),
              WhatsappNumber(),
              SizedBox(height: AppSizes.h24),
              SubmitButton(),
            ],
>>>>>>> 4c0f587 (whatsApp number is now active and fully decorated well)
          ),
        ),
      ),
    );
  }
}
