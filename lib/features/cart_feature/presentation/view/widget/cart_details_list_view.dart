import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ketab/core/services/service_locator.dart';
import 'package:ketab/core/utils/constants/colors.dart';
import 'package:ketab/features/cart_feature/presentation/view_model/cart_cubit.dart';

class CartDetailsListView extends StatelessWidget {
  const CartDetailsListView(
      {super.key,
      required this.imageBook,
      required this.nameBook,
      required this.priceBeforeBook,
      required this.priceAfterBook,
      required this.discountBook,
      required this.length, required this.cartCubit});
  final List<String> imageBook;
  final List<String> nameBook;
  final List<String> priceBeforeBook;
  final List<num> priceAfterBook;
  final List<num> discountBook;
  final int length;
  final CartCubit cartCubit ;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.74,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Container(
                          width: double.infinity,
                          height: MediaQuery.sizeOf(context).height * 0.16,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey)),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.w, vertical: 12.h),
                                    child: Stack(
                                      children: [
                                        Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.22,
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5.w),
                                            ),
                                            child: Image(
                                              image: NetworkImage(
                                                  imageBook[index]),
                                              fit: BoxFit.cover,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.12,
                                            )),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Container(
                                            height: 12.5.h,
                                            width: 27.5.w,
                                            decoration: BoxDecoration(
                                                color: Styles.kPrimaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Center(
                                              child: Text(
                                                '${discountBook[index]}%',
                                                style: TextStyle(
                                                    fontSize: 8.sp,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
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
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        nameBook[index],
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Container(
                                        width: 90.w,
                                        height: 25.h,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey, width: 2)),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                child: GestureDetector(
                                              child: const Icon(Icons.add),
                                              onTap: () {
                                                cartCubit
                                                    .changeNumberOfBooks(true , index);
                                              },
                                            )),
                                            Expanded(
                                                child: Center(
                                                    child: Text(
                                                        ' ${cartCubit.itemQuantity[index]}'))),
                                            Expanded(
                                                child: GestureDetector(
                                              child: const Icon(Icons.remove),
                                              onTap: () {
                                                cartCubit
                                                    .changeNumberOfBooks(false , index);
                                              },
                                            ))
                                          ],
                                        ),
                                      )
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
                                          cartCubit.changeNumberOfBooks(false , index);
                                          cartCubit.deleteItemFromCart(index);
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        )),
                                    const Spacer(),
                                    Text(
                                      '${priceBeforeBook[index]} L.E',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Colors.grey,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                    cartCubit.getAllCartModel!.data !=null ?Text(
                                      '${cartCubit.itemTotal[index]} L.E',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Styles.kPrimaryColor),
                                    ) : Text(
                                      '${cartCubit.itemTotalAfterDelete[index]} L.E',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Styles.kPrimaryColor),
                                    ),

                                  ],
                                ),
                              )
                            ],
                          )),
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
