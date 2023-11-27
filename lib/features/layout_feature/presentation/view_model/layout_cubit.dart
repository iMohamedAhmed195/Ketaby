
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketab/features/cart_feature/presentation/view/widget/cart_view_body.dart';
import 'package:ketab/features/favorite_feature/presentation/view/favorite_view.dart';
import 'package:ketab/features/home_feature/data/home_model/best_seller_model.dart';
import 'package:ketab/features/home_feature/data/home_model/category_model.dart';
import 'package:ketab/features/home_feature/data/home_model/new_arrival_model.dart';
import 'package:ketab/features/home_feature/data/home_model/slider_model.dart';
import 'package:ketab/features/home_feature/data/repos/home_repo.dart';
import 'package:ketab/features/home_feature/presentation/view/home_view_body.dart';
import 'package:ketab/features/profile_feature/presentation/view/profile_view.dart';
import 'package:ketab/features/search_feature/presentation/view/search_view.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(HomeInitial());

static LayoutCubit get(context) => BlocProvider.of(context);

  int? currentIndex= 0 ;
  Widget currentScreen = const HomeViewBody();
  final PageStorageBucket bucket = PageStorageBucket();
  List<Widget> screens = [
    const HomeViewBody(),
    const SearchView(),
    const FavoriteView(),
    const CartViewBody(),
    const ProfileView(),

  ];
  changeCurrentScreen(int index){
    if(index == 0){
      currentScreen = screens[0];
      emit(ChangeCurrentScreen());
    } else if(index == 1){
      currentScreen = screens[1];
      emit(ChangeCurrentScreen());
    }else if(index == 2){
      currentScreen = screens[2];
      emit(ChangeCurrentScreen());
    }else if(index == 3){
      currentScreen = screens[3];
      emit(ChangeCurrentScreen());
    }else if(index == 4){
      currentScreen = screens[4];
      emit(ChangeCurrentScreen());
    }
  }
  changeCurrentIndex(int index){
    currentIndex = index;
    emit(ChangeCurrentIndex());
  }

}
