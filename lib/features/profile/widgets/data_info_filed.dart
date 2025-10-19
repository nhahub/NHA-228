import 'package:flutter/material.dart';

class DataInfoFiled extends StatelessWidget {
  const DataInfoFiled({super.key, this.data});
  final String?  data ;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: double.infinity,
      decoration: BoxDecoration(
        color:Color(0xffF6F6F6),
        borderRadius: BorderRadius.circular(10.0),
      ) ,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(data ?? '', style: Theme.of(context).textTheme.labelMedium,),
        )),
    );
  }
}