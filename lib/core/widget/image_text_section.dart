import 'package:flutter/material.dart';
import 'package:ketab/core/utils/constants/assets.dart';
import 'package:ketab/core/utils/constants/colors.dart';


class ImageAndTextSection extends StatelessWidget {
  const ImageAndTextSection({super.key, required this.namePage});

  final String namePage ;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.5,
            child: Image.asset(AssetsData.logIn,)
        ),

        Text(
          namePage,
          style: const TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 28,
              color: Styles.kPrimaryColor
          ),
        )
      ],
    );
  }
}
