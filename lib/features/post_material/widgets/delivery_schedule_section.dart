import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:nha_228/core/constants/app_colors.dart';
import 'package:nha_228/core/constants/app_sizes.dart';
import 'package:nha_228/core/constants/app_strings.dart';
import 'package:nha_228/features/post_material/cubit/post_material_cubit.dart';

class DeliveryScheduleSection extends StatefulWidget {
  const DeliveryScheduleSection({super.key});

  @override
  State<DeliveryScheduleSection> createState() => _DeliveryScheduleSectionState();
}

class _DeliveryScheduleSectionState extends State<DeliveryScheduleSection> {
  bool scheduleEnabled = false;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final date = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: now.add(const Duration(days: 30)),
    );
    if (date != null) setState(() => selectedDate = date);
  }

  Future<void> _pickTime() async {
    final time = await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (time != null) setState(() => selectedTime = time);
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PostMaterialCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Text(
              AppStrings.scheduleDelivery,
              style: TextStyle(fontSize: AppSizes.sp20, fontWeight: FontWeight.w600),
            ),
            Switch(
              value: scheduleEnabled,
              onChanged: (val) {
                setState(() => scheduleEnabled = val);
              },
            ),
          ],
        ),

        if (scheduleEnabled) ...[
           SizedBox(height: AppSizes.h16),

          GestureDetector(
            onTap: _pickDate,
            child: Container(
              padding: EdgeInsets.all(AppSizes.r14),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(AppSizes.r12),
                border: Border.all(color: AppColors.borderSide),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    selectedDate != null
                        ? DateFormat.yMMMd().format(selectedDate!)
                        : AppStrings.chooseADate,
                    style: TextStyle(
                      color: selectedDate != null ? AppColors.textPrimary : AppColors.borderSide,
                    ),
                  ),
                   Icon(Icons.calendar_today_outlined, color: AppColors.borderSide),
                ],
              ),
            ),
          ),

           SizedBox(height: AppSizes.h16),

          GestureDetector(
            onTap: _pickTime,
            child: Container(
              padding: EdgeInsets.all(AppSizes.r14),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(AppSizes.r12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    selectedTime != null
                        ? selectedTime!.format(context)
                        : AppStrings.chooseTime,
                    style: TextStyle(
                      color: selectedTime != null ? AppColors.textPrimary : AppColors.borderSide,
                    ),
                  ),
                   Icon(Icons.access_time_outlined, color: AppColors.borderSide),
                ],
              ),
            ),
          ),

           SizedBox(height: AppSizes.h16),

          TextField(
            decoration: InputDecoration(
              hintText: AppStrings.deliveryLocation,
              filled: true,
              fillColor: AppColors.whiteColor,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(AppSizes.r12),
              ),
            ),
            onChanged: (val) => cubit.setLocation(val),
          ),
        ],
      ],
    );
  }
}
