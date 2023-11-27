import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ketab/core/services/service_locator.dart';

import 'package:ketab/core/utils/constants/colors.dart';
import 'package:ketab/features/book_details_feature/presentation/view_model/details_cubit.dart';

class DetailsImageSection extends StatelessWidget {
  const DetailsImageSection({super.key, required this.image, required this.bookId});

  final String image;
  final int bookId;
  @override
  Widget build(BuildContext context) {
    DetailsCubit detailsCubit =sl<DetailsCubit>();
    return BlocProvider(
      create: (context) =>detailsCubit,
      child: BlocConsumer<DetailsCubit, DetailsState>(
        listener: (context, state) {
          if(state is MakeFavoriteSuccess){
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                )),
                child: Image(
                  image: NetworkImage(image),
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * 0.45,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        GoRouter.of(context).pop();
                      },
                      child: Container(
                          width: 40.w,
                          height: 35.h,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(40)),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          )),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: (){
                        detailsCubit.changeFavorite(detailsCubit.isFavorite);
                        if( detailsCubit.isFavorite == true)
                        {
                          detailsCubit.makeFavorite(bookId: bookId);
                        }else if ( detailsCubit.isFavorite ==false){
                          detailsCubit.removeFavorite(bookId: bookId);
                        }
                      },
                      child: Container(
                          width: 40.w,
                          height: 35.h,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(40)),
                          child:detailsCubit.isFavorite
                              ? const Icon(
                                  Icons.favorite,
                                  color: Styles.kPrimaryColor,
                                )
                              : const Icon(
                                  Icons.favorite_border,
                                  color: Colors.white,
                                )),
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
