import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ketab/core/services/app_reouter.dart';
import 'package:ketab/core/services/service_locator.dart';
import 'package:ketab/core/utils/constants/colors.dart';
import 'package:ketab/features/book_details_feature/presentation/view/book_details_view.dart';
import 'package:ketab/features/favorite_feature/presentation/view_model/favorite_cubit.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody(
      {super.key,
      required this.imageBook,
      required this.nameBook,
      required this.categoryBook,
      required this.priceBeforeBook,
      required this.priceAfterBook,
      required this.discountBook,
      required this.length,
      required this.description,
      required this.bookId});
  final List<String> imageBook;
  final List<int> bookId;
  final List<String> nameBook;
  final List<String> categoryBook;
  final List<String> priceBeforeBook;
  final List<String> priceAfterBook;
  final List<String> description;
  final List<num> discountBook;
  final int length;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteCubit, FavoriteState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.74,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              length == 0
                  ? Center(
                      child: Text(
                        'No Favorite Item',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 28.sp),
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BookDetailsView(
                                            description: description[index],
                                            image: imageBook[index],
                                            nameBook: nameBook[index],
                                            category: categoryBook[index],
                                            priceBefore: priceBeforeBook[index],
                                            priceAfter: priceAfterBook[index],
                                            bookId: bookId[index],
                                          )));
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              child: Container(
                                  width: double.infinity,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.235,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: Colors.grey)),
                                  child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20.w,
                                                vertical: 12.h),
                                            child: Stack(
                                              children: [
                                                Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.28,
                                                    clipBehavior: Clip
                                                        .antiAliasWithSaveLayer,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.w),
                                                    ),
                                                    child: Image(
                                                      image: NetworkImage(
                                                          imageBook[index]),
                                                      fit: BoxFit.cover,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.19,
                                                    )),
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Container(
                                                    height: 25.h,
                                                    width: 55.w,
                                                    decoration: BoxDecoration(
                                                        color: Styles
                                                            .kPrimaryColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    child: Center(
                                                      child: Text(
                                                        '${discountBook[index]}%',
                                                        style: TextStyle(
                                                            fontSize: 16.sp,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                nameBook[index],
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                                style: TextStyle(
                                                    fontSize: 16.sp,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              Text(
                                                categoryBook[index],
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: TextStyle(
                                                    fontSize: 16.sp,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              Text(
                                                '${priceBeforeBook[index]} L.E',
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: TextStyle(
                                                  fontSize: 14.sp,
                                                  color: Colors.grey,
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                ),
                                              ),
                                              Text(
                                                '${priceAfterBook[index]} L.E',
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: TextStyle(
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w600,
                                                    color:
                                                        Styles.kPrimaryColor),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 8.0, top: 8.0, bottom: 8.0),
                                        child: Column(
                                          children: [
                                            IconButton(
                                                onPressed: () {
                                                  sl<FavoriteCubit>()
                                                      .removeFavorite(
                                                          index: index);
                                                },
                                                icon: const Icon(
                                                  Icons.favorite,
                                                  color: Styles.kPrimaryColor,
                                                )),
                                            const Spacer(),
                                            IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.add_shopping_cart))
                                          ],
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                          );
                        },
                        itemCount: length,
                      ),
                    )
            ],
          ),
        );
      },
    );
  }
}
