import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ketab/core/utils/constants/assets.dart';
import 'package:ketab/core/utils/constants/colors.dart';

class ImageProfileSection extends StatelessWidget {
  const ImageProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height  * 0.28,
              decoration: const BoxDecoration(
                  color: Styles.kPrimaryColor,
                  borderRadius: BorderRadius.only(bottomRight: Radius.elliptical(200 , 50),bottomLeft: Radius.elliptical(200 , 50) , )
              ),
              child:  Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 80.0),
                  child: Text('Profile',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35.sp,
                        fontWeight: FontWeight.w700
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height  * 0.12,

            ),
          ],
        ),
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width * 0.6,
              height: MediaQuery.sizeOf(context).height * 0.26,

              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(200),
                  border: Border.all(color:Colors.grey[200]!)
              ),
            ),
            Container(
              width: MediaQuery.sizeOf(context).width * 0.55,
              height: MediaQuery.sizeOf(context).height * 0.24,

              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100)
              ),
              child: Image(
                image: const AssetImage(AssetsData.profile),
                width: MediaQuery.sizeOf(context).width * 0.5,
                height:MediaQuery.sizeOf(context).height * 0.2 ,
                fit: BoxFit.cover,
              ),
            ),
          ],
        )

      ],
    );
  }
}
