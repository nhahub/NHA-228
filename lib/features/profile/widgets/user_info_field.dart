import 'package:flutter/material.dart';

class UserInfoField extends StatelessWidget {
  const UserInfoField({super.key,  this.info});
 final String? info ;
  @override
  Widget build(BuildContext context) {
   return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(0.05),
            blurRadius: 6,
            spreadRadius: 2,
          )
        ],
      ),
      child: Text(
        info??'',
        style: const TextStyle(fontSize: 15, color: Colors.black87),
      ),
    );
  }
}