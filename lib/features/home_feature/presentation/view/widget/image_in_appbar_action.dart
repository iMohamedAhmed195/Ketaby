import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ketab/core/utils/constants/assets.dart';

class ImageAppBarAction extends StatelessWidget {
  const ImageAppBarAction({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:   EdgeInsets.only(right: 20.0.r),
      child: Container(
        width: 55.w,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(250.w)
        ),
        child: Image.asset(AssetsData.profile,fit: BoxFit.cover,
        ),


      ),
    );
  }
}
