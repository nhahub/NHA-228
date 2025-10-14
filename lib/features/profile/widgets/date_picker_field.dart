import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nha_228/core/constants/app_colors.dart';
import 'package:nha_228/core/constants/app_sizes.dart';
import 'package:nha_228/core/constants/app_strings.dart';

class DatePickerField extends StatefulWidget {
  const DatePickerField({super.key});

  @override
  State<DatePickerField> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  TextEditingController dateController = TextEditingController();

  Future<void> selectDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (date != null) {
      setState(() {
        String formattedDate = DateFormat('dd/MM/yyyy').format(date);
        dateController.text = formattedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSizes.h10),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppStrings.dateOfBirth, style: Theme.of(context).textTheme.labelMedium),
          SizedBox(height: AppSizes.h8),
          TextField(
            controller: dateController,
            readOnly: true,
            decoration: InputDecoration(
              hintText: AppStrings.dateOfBirth,
              filled: true,
              fillColor: AppColors.textFieldfillColor,
              suffixIcon: IconButton(
                onPressed: () {
                  selectDate();
                },
                icon: Icon(Icons.calendar_month),
              ),

              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(AppSizes.r10),
              ),

              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(AppSizes.r10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
