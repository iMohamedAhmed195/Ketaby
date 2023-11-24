import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ketab/core/utils/constants/colors.dart';

class TotalPriceSection extends StatelessWidget {
  const TotalPriceSection({super.key, required this.finalPrice});

  final num finalPrice;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 30.0.h),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.9,
        height: MediaQuery.sizeOf(context).height * 0.08,
        decoration:  BoxDecoration(
            color: Styles.kPrimaryColor,
            borderRadius: BorderRadius.circular(20)
        ),
        child:
        Row(
          children: [
            SizedBox(width: 15.w,),
            Text(
              'total price: ',
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white
              ),
            ),
            Text(
              '$finalPrice L.E',
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white
              ),
            ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: MaterialButton(
                onPressed: (){},
                child: const Text(
                  'CheckOut',
                  style: TextStyle(
                      color: Styles.kPrimaryColor
                  ),
                ),
              ),
            ),
            SizedBox(width: 15.w,)
          ],
        ),
      ),
    );
  }
}
