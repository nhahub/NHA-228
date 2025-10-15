import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
            const Text(
              "Collection service 🛵",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Switch(
              value: enabled,
              onChanged: (val) => setState(() => enabled = val),
              // activeThumbColor: Colors.green,
            ),
          ],
        ),
        if (enabled) ...[
          const SizedBox(height: 10),
          const Text("Preferred date", style: TextStyle(fontWeight: FontWeight.w500)),
          const SizedBox(height: 6),
          GestureDetector(
            onTap: pickDate,
            child: AbsorbPointer(
              child: TextField(
                decoration: InputDecoration(
                  hintText:
                      preferredDate == null
                          ? "Select date"
                          : DateFormat('yyyy-MM-dd').format(preferredDate!),
                  suffixIcon: const Icon(Icons.calendar_today_outlined),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text("Preferred time", style: TextStyle(fontWeight: FontWeight.w500)),
          const SizedBox(height: 6),
          DropdownButtonFormField<String>(
            // initialValue: preferredTime,
            hint: const Text("Select time"),
            items:
                timeSlots.map((t) => DropdownMenuItem(value: t, child: Text(t))).toList(),
            onChanged: (val) => setState(() => preferredTime = val),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text("Location", style: TextStyle(fontWeight: FontWeight.w500)),
          const SizedBox(height: 6),
          TextField(
            decoration: InputDecoration(
              hintText: "Enter your address",
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
