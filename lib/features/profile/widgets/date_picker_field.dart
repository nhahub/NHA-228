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
    setState(() {
      String formattedDate = DateFormat('dd/MM/yyyy').format(date!);
      dateController.text = formattedDate;
    });
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
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:nha_228/core/constants/app_colors.dart';
// import 'package:nha_228/core/constants/app_strings.dart';
// import 'package:nha_228/core/constants/app_values.dart';

// class DatePickerField extends StatefulWidget {
//   final DateTime? initialDate;
//   final Function(DateTime)? onDateSelected;

//   const DatePickerField({
//     super.key,
//     this.initialDate,
//     this.onDateSelected,
//   });

//   @override
//   State<DatePickerField> createState() => _DatePickerFieldState();
// }

// class _DatePickerFieldState extends State<DatePickerField> {
//   late TextEditingController dateController;

//   @override
//   void initState() {
//     super.initState();
//     dateController = TextEditingController(
//       text: widget.initialDate != null
//           ? DateFormat('dd/MM/yyyy').format(widget.initialDate!)
//           : '',
//     );
//   }

//   Future<void> selectDate() async {
//     DateTime? date = await showDatePicker(
//       context: context,
//       firstDate: DateTime(1900),
//       lastDate: DateTime(2100),
//       initialDate: widget.initialDate ?? DateTime(2000),
//     );
//     if (date != null) {
//       setState(() {
//         String formattedDate = DateFormat('dd/MM/yyyy').format(date);
//         dateController.text = formattedDate;
//       });
//       widget.onDateSelected?.call(date);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: AppValues.h10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(AppStrings.dateOfBirth,
//               style: Theme.of(context).textTheme.labelMedium),
//           SizedBox(height: AppValues.h8),
//           TextField(
//             controller: dateController,
//             readOnly: true,
//             decoration: InputDecoration(
//               hintText: AppStrings.dateOfBirth,
//               filled: true,
//               fillColor: AppColors.textFieldfillColor,
//               suffixIcon: IconButton(
//                 onPressed: selectDate,
//                 icon: const Icon(Icons.calendar_month),
//               ),
//               border: OutlineInputBorder(
//                 borderSide: BorderSide.none,
//                 borderRadius: BorderRadius.circular(AppValues.r10),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
