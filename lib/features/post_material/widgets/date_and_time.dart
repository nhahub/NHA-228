import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:nha_228/core/core.dart';
import 'package:nha_228/features/post_material/cubit/post_material_cubit.dart';

class DateAndTime extends StatefulWidget {
  const DateAndTime({super.key});

  @override
  State<DateAndTime> createState() => _DateAndTimeState();
}

class _DateAndTimeState extends State<DateAndTime> {
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
              style: TextStyle(
                fontSize: AppSizes.sp18,
                fontWeight: FontWeight.w400,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
        SizedBox(height: AppSizes.h8),
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
                    color:
                        selectedDate != null
                            ? AppColors.addAPhotoOutlined
                            : AppColors.shadow,
                  ),
                ),
                Icon(Icons.calendar_today_outlined, color: AppColors.shadow),
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
              border: Border.all(color: AppColors.borderSide),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedTime != null
                      ? selectedTime!.format(context)
                      : AppStrings.chooseTime,
                  style: TextStyle(
                    color:
                        selectedTime != null
                            ? AppColors.addAPhotoOutlined
                            : AppColors.shadow,
                  ),
                ),
                Icon(Icons.access_time_outlined, color: AppColors.shadow),
              ],
            ),
          ),
        ),
      ],
    );
  }
}