import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CarouselImageHome extends StatelessWidget {
  const CarouselImageHome({super.key, required this.image, required this.index});

  final List<String> image ;
  final int index ;
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
              child: Image(
                image: NetworkImage(image[index]),
                fit: BoxFit.cover,
              )
            ),
          );
        },
        itemCount: index,
      ),
    );
  }
}
