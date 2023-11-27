import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageAppBarAction extends StatelessWidget {
  const ImageAppBarAction({super.key, required this.image,});
  final String image;
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
        child: Image(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
        ),


      );
  }
}
