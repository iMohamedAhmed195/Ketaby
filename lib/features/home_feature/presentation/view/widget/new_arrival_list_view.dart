import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ketab/core/utils/constants/colors.dart';

class NewArrivalListView extends StatelessWidget {
  const NewArrivalListView({super.key, required this.imageBook, required this.nameBook, required this.categoryBook, required this.priceBeforeBook, required this.priceAfterBook, required this.discountBook, required this.length});

  final List<String> imageBook ;
  final List<String> nameBook ;
  final List<String> categoryBook ;
  final List<String> priceBeforeBook ;
  final List<double> priceAfterBook ;
  final List<int> discountBook ;
  final int length;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.only( left: 20.0.w ,right: 20.0.w),
          child: Row(
            children: [
              Text(
                'New Arrival',
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700
                ),
              ),
              const Spacer(),
              IconButton(onPressed: (){}, icon:  Icon(Icons.arrow_forward,size: 24.w,))
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.38,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context , index){
              return SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.4,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20).r,
                      child: Stack(
                        children: [
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.35,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.w),
                                boxShadow: const [
                                  BoxShadow(color: Colors.grey,blurRadius:7  ,spreadRadius: 1 , offset: Offset( 5 , 5))
                                ]
                            ),
                            child: Image(
                              image: NetworkImage(imageBook[index]),
                              fit: BoxFit.cover,height: MediaQuery.sizeOf(context).height * 0.22,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              height: 25.h,
                              width: 55.w,
                              decoration: BoxDecoration(
                                  color: Styles.kPrimaryColor,
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Center(
                                child: Text(
                                  '${discountBook[index]}%',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.white
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20).r,
                      child: Text(
                        nameBook[index],
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          overflow: TextOverflow.ellipsis,

                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                    ),
                    const SizedBox(height: 6,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20).r,
                      child: Text(
                        categoryBook[index],
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey,
                          overflow: TextOverflow.ellipsis,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                      ),
                    ),
                    const SizedBox(height: 6,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20).r,
                      child: Text(
                        '${priceBeforeBook[index]} L.E',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey,
                          overflow: TextOverflow.ellipsis,
                          decoration: TextDecoration.lineThrough,

                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                      ),
                    ),
                    const SizedBox(height: 6,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20).r,
                      child: Text(
                        "${priceAfterBook[index]} L.E",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Styles.kPrimaryColor,
                          overflow: TextOverflow.ellipsis,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              );
            },
            itemCount: length,
          ),
        ),
      ],
    );
  }
}
