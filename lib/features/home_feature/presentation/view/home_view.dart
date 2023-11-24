import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ketab/core/services/service_locator.dart';
import 'package:ketab/core/utils/constants/colors.dart';
import 'package:ketab/features/home_feature/presentation/view/widget/image_in_appbar_action.dart';
import 'package:ketab/features/home_feature/presentation/view/widget/menu_item.dart';
import 'package:ketab/features/home_feature/presentation/view/widget/title_of_app_bar.dart';
import 'package:ketab/features/home_feature/presentation/view_model/home_cubit.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.imageProfile, required this.nameProfile, required this.emailProfile});
  final String imageProfile;
  final String nameProfile;
  final String emailProfile;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeCubit>()..getSliderData()..getBestSellerData()..getCategoryData()..getNewArrivalData(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          return sl<HomeCubit>().currentIndex == 4 ? Scaffold(
            backgroundColor: Colors.white,
            floatingActionButton: FloatingActionButton(
              backgroundColor: Styles.kPrimaryColor,
                child: const Icon(Icons.favorite),
                onPressed: (){
                  sl<HomeCubit>().changeCurrentScreen(2);
                  sl<HomeCubit>().changeCurrentIndex(2);
                }
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomAppBar(
              shape: const CircularNotchedRectangle(),
              notchMargin: 10,
              child: SizedBox(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:<Widget> [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MaterialButton(
                          minWidth: 40,
                          onPressed: (){
                            sl<HomeCubit>().changeCurrentScreen(0);
                            sl<HomeCubit>().changeCurrentIndex(0);

                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.home,
                                color: sl<HomeCubit>().currentIndex == 0 ? Styles.kPrimaryColor : Colors .grey,
                              ),
                              Text(
                                'Home',
                                style: TextStyle(
                                  color: sl<HomeCubit>().currentIndex == 0 ? Styles.kPrimaryColor : Colors .grey,
                                ),
                              )
                            ],
                          ),
                        ),
                        MaterialButton(
                          minWidth: 40,
                          onPressed: (){
                            sl<HomeCubit>().changeCurrentScreen(1);
                            sl<HomeCubit>().changeCurrentIndex(1);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.book,
                                color: sl<HomeCubit>().currentIndex == 1 ? Styles.kPrimaryColor : Colors .grey,
                              ),
                              Text(
                                'Books',
                                style: TextStyle(
                                  color: sl<HomeCubit>().currentIndex == 1 ? Styles.kPrimaryColor : Colors .grey,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MaterialButton(
                          minWidth: 40,
                          onPressed: (){
                            sl<HomeCubit>().changeCurrentScreen(3);
                            sl<HomeCubit>().changeCurrentIndex(3);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_shopping_cart,
                                color: sl<HomeCubit>().currentIndex == 3 ? Styles.kPrimaryColor : Colors .grey,
                              ),
                              Text(
                                'Cart',
                                style: TextStyle(
                                  color: sl<HomeCubit>().currentIndex == 3 ? Styles.kPrimaryColor : Colors .grey,
                                ),
                              )
                            ],
                          ),
                        ),
                        MaterialButton(
                          minWidth: 40,
                          onPressed: (){
                            sl<HomeCubit>().changeCurrentScreen(4);
                            sl<HomeCubit>().changeCurrentIndex(4);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.person,
                                color: sl<HomeCubit>().currentIndex == 4 ? Styles.kPrimaryColor : Colors .grey,
                              ),
                              Text(
                                'Person',
                                style: TextStyle(
                                  color: sl<HomeCubit>().currentIndex == 4 ? Styles.kPrimaryColor : Colors .grey,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            body: PageStorage(
                bucket: sl<HomeCubit>().bucket,
                child: sl<HomeCubit>().currentScreen),
          ) :
          Scaffold(
              backgroundColor: Colors.white,
              appBar: PreferredSize(preferredSize: Size.fromHeight(MediaQuery
                  .sizeOf(context)
                  .height * 0.09),
                child: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                leading: Builder(builder: (context) =>
                    GestureDetector(
                      onTap: () {
                        Scaffold.of(context).openDrawer();
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 25,
                            height: 2,
                            color: Colors.black,
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Container(
                            width: 17,
                            height: 2,
                            color: Colors.black,
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Container(
                            width: 10,
                            height: 2,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    )),
                title:  TitleOfAppBar(name: nameProfile,),
                centerTitle: false,
                actions:  [
                  ImageAppBarAction(image: imageProfile,)
                ],
              ),),
              drawer: Drawer(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: MediaQuery.sizeOf(context).height * 0.3,
                            color: Styles.kPrimaryColor,
                            child:Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.only(right: 20.0.r),
                                    child: Container(
                                      width: 80.w,
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.circular(250.w)
                                      ),
                                      child: Image(
                                        image: NetworkImage(imageProfile),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '$nameProfile',
                                    style: TextStyle(
                                        fontSize: 24.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white
                                    ),
                                  ),
                                  Text(
                                    '$emailProfile',
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                          MenuItem(
                              text: 'Order History',
                              icon: Icons.history_edu,
                              context: context
                          ),
                          Padding(
                            padding:  EdgeInsets.only(right: 20.0.w,left: 20.0.w),
                            child: Container(
                              color: Colors.grey,
                              height: 1,
                              width: double.infinity,
                            ),
                          ),
                          MenuItem(
                              text: 'Edit Profile',
                              icon: Icons.edit,
                              context: context
                          ),
                          Padding(
                            padding:  EdgeInsets.only( right: 20.0.w,left: 20.0.w),
                            child: Container(
                              color: Colors.grey,
                              height: 1,
                              width: double.infinity,
                            ),
                          ),
                          MenuItem(
                              text: 'Change Password',
                              icon: Icons.change_circle_outlined,
                              context: context
                          ),
                          Padding(
                            padding:  EdgeInsets.only( right: 20.0.w,left: 20.0.w),
                            child: Container(
                              color: Colors.grey,
                              height: 1,
                              width: double.infinity,
                            ),
                          ),
                          MenuItem(
                              text: 'LogOut',
                              icon: Icons.exit_to_app_rounded,
                              context: context,
                            color: Colors.red,
                          ),

                        ],
                      )
                    ],
                  ),
                ),
              ),
              floatingActionButton: FloatingActionButton(
                child: const Icon(Icons.favorite),
              onPressed: (){
                sl<HomeCubit>().changeCurrentScreen(2);
                sl<HomeCubit>().changeCurrentIndex(2);
              }
          ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomAppBar(
              shape: const CircularNotchedRectangle(),
              notchMargin: 10,
              child: SizedBox(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:<Widget> [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MaterialButton(
                              minWidth: 40,
                                onPressed: (){
                                  sl<HomeCubit>().changeCurrentScreen(0);
                                  sl<HomeCubit>().changeCurrentIndex(0);

                                },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                      Icons.home,
                                      color: sl<HomeCubit>().currentIndex == 0 ? Styles.kPrimaryColor : Colors .grey,
                                  ),
                                  Text(
                                    'Home',
                                    style: TextStyle(
                                      color: sl<HomeCubit>().currentIndex == 0 ? Styles.kPrimaryColor : Colors .grey,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            MaterialButton(
                              minWidth: 40,
                              onPressed: (){
                                sl<HomeCubit>().changeCurrentScreen(1);
                                sl<HomeCubit>().changeCurrentIndex(1);
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.book,
                                    color: sl<HomeCubit>().currentIndex == 1 ? Styles.kPrimaryColor : Colors .grey,
                                  ),
                                  Text(
                                    'Books',
                                    style: TextStyle(
                                      color: sl<HomeCubit>().currentIndex == 1 ? Styles.kPrimaryColor : Colors .grey,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MaterialButton(
                              minWidth: 40,
                              onPressed: (){
                                sl<HomeCubit>().changeCurrentScreen(3);
                                sl<HomeCubit>().changeCurrentIndex(3);
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add_shopping_cart,
                                    color: sl<HomeCubit>().currentIndex == 3 ? Styles.kPrimaryColor : Colors .grey,
                                  ),
                                  Text(
                                    'Cart',
                                    style: TextStyle(
                                      color: sl<HomeCubit>().currentIndex == 3 ? Styles.kPrimaryColor : Colors .grey,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            MaterialButton(
                              minWidth: 40,
                              onPressed: (){
                                sl<HomeCubit>().changeCurrentScreen(4);
                                sl<HomeCubit>().changeCurrentIndex(4);
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.person,
                                    color: sl<HomeCubit>().currentIndex == 4 ? Styles.kPrimaryColor : Colors .grey,
                                  ),
                                  Text(
                                    'Person',
                                    style: TextStyle(
                                      color: sl<HomeCubit>().currentIndex == 4 ? Styles.kPrimaryColor : Colors .grey,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                  ],
                ),
              ),
            ),
            body: PageStorage(
                bucket: sl<HomeCubit>().bucket,
                child: sl<HomeCubit>().currentScreen),
          );
        },
      ),
    );
  }
}
