import 'package:flutter/material.dart';
import 'package:nha_228/core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nha_228/features/post_material/cubit/post_material_cubit.dart';
import 'package:nha_228/features/post_material/widgets/delivery_schedule_section.dart';
import 'package:nha_228/features/post_material/widgets/description_field.dart';
import 'package:nha_228/features/post_material/widgets/image_picker_field.dart';
import 'package:nha_228/features/post_material/widgets/location_field.dart';
import 'package:nha_228/features/post_material/widgets/material_grid.dart';
import 'package:nha_228/features/post_material/widgets/quantity_selector.dart';
import 'package:nha_228/features/post_material/widgets/submit_button.dart';

class PostMaterialScreen extends StatelessWidget {
  const PostMaterialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PostMaterialCubit(),
      child: Scaffold(
        appBar: CustomAppBar(title: AppStrings.postingMaterials),
        body: Padding(
          padding: EdgeInsets.all(AppSizes.w16),
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
              DeliveryScheduleSection(),
              SizedBox(height: AppSizes.h24),
              SubmitButton(),
            ],
          ),
        ),
      ),
    );
  }
}
