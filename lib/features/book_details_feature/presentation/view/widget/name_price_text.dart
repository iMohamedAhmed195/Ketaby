import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ketab/core/utils/constants/colors.dart';

class NameAndPriceBook extends StatelessWidget {
  const NameAndPriceBook({super.key, required this.nameBook, required this.category, required this.priceBefore, required this.priceAfter});

  final String nameBook;
  final String category;
  final String priceBefore;
  final String priceAfter;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.0.w , vertical: 20.0.h),
          child: Text(
             nameBook,
            style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.w800
            ),
          ),
        ),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.0.w),
          child: Row(
            children: [
              Text(
                category,
                style: TextStyle(
                    fontSize: 18.sp
                ),
              ),
              Spacer(),
              Column(
                children: [
                  Text(
                    '$priceBefore L.E',
                    style: TextStyle(
                      fontSize: 18.sp,
                        color: Colors.grey[500],
                        decoration: TextDecoration.lineThrough
                    ),

                  ),
                  Text(
                    '$priceAfter L.E',
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: Styles.kPrimaryColor
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
