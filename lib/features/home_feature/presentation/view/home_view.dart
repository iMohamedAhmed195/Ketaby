import 'package:flutter/material.dart';
import 'package:ketab/features/home_feature/presentation/view/home_view_body.dart';
import 'package:ketab/features/home_feature/presentation/view/widget/image_in_appbar_action.dart';
import 'package:ketab/features/home_feature/presentation/view/widget/menu_item.dart';
import 'package:ketab/features/home_feature/presentation/view/widget/title_of_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(preferredSize:Size.fromHeight(MediaQuery.sizeOf(context).height * 0.09) , child: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(builder: (context)=> GestureDetector(
          onTap: (){
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
        ) ),
        title: const TitleOfAppBar(),
        centerTitle: false,
        actions: const [
          ImageAppBarAction()
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

      body: const HomeViewBody(),
    );
  }
}
