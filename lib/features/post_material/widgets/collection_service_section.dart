import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nha_228/core/constants/app_sizes.dart';
import 'package:nha_228/core/constants/app_strings.dart';

class CollectionServiceSection extends StatefulWidget {
  const CollectionServiceSection({super.key});

  @override
  State<CollectionServiceSection> createState() => _CollectionServiceSectionState();
}

class _CollectionServiceSectionState extends State<CollectionServiceSection> {
  bool enabled = false;
  DateTime? preferredDate;
  String? preferredTime;

  final timeSlots = ["9:00 AM - 11:00 AM", "12:00 PM - 2:00 PM", "4:00 PM - 6:00 PM"];

  Future<void> pickDate() async {
    final picked = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
      initialDate: DateTime.now(),
    );
    if (picked != null) setState(() => preferredDate = picked);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Text(
              AppStrings.collectionService,
              style: TextStyle(fontSize: AppSizes.h16, fontWeight: FontWeight.w600),
            ),
            Switch(
              value: enabled,
              onChanged: (val) => setState(() => enabled = val),
              // activeThumbColor: Colors.green,
            ),
          ],
        ),
        if (enabled) ...[
          SizedBox(height: AppSizes.h10 ),
           Text(AppStrings.preferredDate, style: TextStyle(fontWeight: FontWeight.w500)),
           SizedBox(height: AppSizes.h6),
          GestureDetector(
            onTap: pickDate,
            child: AbsorbPointer(
              child: TextField(
                decoration: InputDecoration(
                  hintText:
                      preferredDate == null
                          ? AppStrings.selectDate
                          : DateFormat('yyyy-MM-dd').format(preferredDate!),
                  suffixIcon: const Icon(Icons.calendar_today_outlined),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSizes.r12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
         SizedBox(height: AppSizes.h16),
          const Text(AppStrings.preferredTime, style: TextStyle(fontWeight: FontWeight.w500)),
           SizedBox(height: AppSizes.h6),
          DropdownButtonFormField<String>(
            // initialValue: preferredTime,
            hint: const Text(AppStrings.selectTime),
            items:
                timeSlots.map((t) => DropdownMenuItem(value: t, child: Text(t))).toList(),
            onChanged: (val) => setState(() => preferredTime = val),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.r12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
           SizedBox(height: AppSizes.h16),
          const Text(AppStrings.location, style: TextStyle(fontWeight: FontWeight.w500)),
           SizedBox(height: AppSizes.h6),
          TextField(
            decoration: InputDecoration(
              hintText: AppStrings.enterYourAddress,
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.r12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
