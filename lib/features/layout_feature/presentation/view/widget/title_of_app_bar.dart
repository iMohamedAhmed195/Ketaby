import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleOfAppBar extends StatelessWidget {
  const TitleOfAppBar({super.key, required this.name,});
  final String name ;
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hi, $name',
          style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w800,
              color: Colors.black
          ),
        ),
        Text(
          'What are you reading today?',
          style: TextStyle(
              fontSize: 14.sp,
              color: Colors.black
          ),
        ),
      ],
    );
  }
}
