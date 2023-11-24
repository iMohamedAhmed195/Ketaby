import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({super.key, required this.description});
 final String description;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Description :',
              style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w800
              ),
            ),
            Text(
              description,
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.normal
              ),
            ),
          ],
        ),
      ),
    );
  }
}
