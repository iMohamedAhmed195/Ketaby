import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketab/core/services/service_locator.dart';
import 'package:ketab/features/home_feature/presentation/view/widget/image_in_appbar_action.dart';
import 'package:ketab/features/home_feature/presentation/view/widget/menu_item.dart';
import 'package:ketab/features/home_feature/presentation/view/widget/title_of_app_bar.dart';
import 'package:ketab/features/home_feature/presentation/view_model/home_cubit.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.imageProfile, required this.nameProfile});
  final String imageProfile;
  final String nameProfile;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeCubit>()..getSliderData()..getBestSellerData()..getCategoryData()..getNewArrivalData(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          return Scaffold(
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
                      Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: Column(
                          children: [
                            MenuItem(
                                text: 'Add User',
                                icon: Icons.add,
                                context: context),

                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              floatingActionButton: FloatingActionButton(
                child: const Icon(Icons.favorite),
              onPressed: (){}
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
                                      color: sl<HomeCubit>().currentIndex == 0 ? Colors.blue : Colors .grey,
                                  ),
                                  Text(
                                    'Home',
                                    style: TextStyle(
                                      color: sl<HomeCubit>().currentIndex == 0 ? Colors.blue : Colors .grey,
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
                                    color: sl<HomeCubit>().currentIndex == 1 ? Colors.blue : Colors .grey,
                                  ),
                                  Text(
                                    'Books',
                                    style: TextStyle(
                                      color: sl<HomeCubit>().currentIndex == 1 ? Colors.blue : Colors .grey,
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
                                sl<HomeCubit>().changeCurrentScreen(2);
                                sl<HomeCubit>().changeCurrentIndex(2);
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add_shopping_cart,
                                    color: sl<HomeCubit>().currentIndex == 2 ? Colors.blue : Colors .grey,
                                  ),
                                  Text(
                                    'Cart',
                                    style: TextStyle(
                                      color: sl<HomeCubit>().currentIndex == 2 ? Colors.blue : Colors .grey,
                                    ),
                                  )
                                ],
                              ),
                            ),
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
                                    Icons.person,
                                    color: sl<HomeCubit>().currentIndex == 3 ? Colors.blue : Colors .grey,
                                  ),
                                  Text(
                                    'Person',
                                    style: TextStyle(
                                      color: sl<HomeCubit>().currentIndex == 3 ? Colors.blue : Colors .grey,
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
