import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ketab/core/utils/constants/assets.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key, required this.nameCategory, required this.lengthCategory});
  final List<String> nameCategory;
  final int lengthCategory;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.0.w, right: 20.0.w),
          child: Row(
            children: [
              Text(
                'Categories',
                style: TextStyle(
                    fontSize: 20.sp, fontWeight: FontWeight.w700),
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward,
                    size: 24.w,
                  ))
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.15,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context , index){
              return Padding(
                padding:  EdgeInsets.all(8.0.r),
                child: Stack(
                  children: [
                    Container(
                        width: MediaQuery.sizeOf(context).width * 0.333333333,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r)
                        ),
                        child: Image.asset(AssetsData.category)
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.333333333,
                      height: 80.h,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.45),
                          borderRadius: BorderRadius.circular(20.r)
                      ),
                      child: Center(
                        child: Text(
                          nameCategory[index],

                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w900,

                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
            itemCount: lengthCategory,
          ),
        ),
      ],
    );
  }
}
