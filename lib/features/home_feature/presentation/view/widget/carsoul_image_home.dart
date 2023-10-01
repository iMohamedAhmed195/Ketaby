import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ketab/core/utils/constants/assets.dart';

class CarouselImageHome extends StatelessWidget {
  const CarouselImageHome({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.22,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context , index){
          return Padding(
            padding: const EdgeInsets.only(left: 5).r,
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.9,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.w)
              ),
              child: Image.asset(AssetsData.profile,fit: BoxFit.cover,),
            ),
          );
        },
        itemCount: 5,
      ),
    );
  }
}
