
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketab/features/home_feature/data/home_model/best_seller_model.dart';
import 'package:ketab/features/home_feature/data/home_model/category_model.dart';
import 'package:ketab/features/home_feature/data/home_model/new_arrival_model.dart';
import 'package:ketab/features/home_feature/data/home_model/slider_model.dart';
import 'package:ketab/features/home_feature/data/repos/home_repo.dart';
import 'package:ketab/features/home_feature/presentation/view/home_view_body.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());

  final HomeRepo homeRepo ;


static HomeCubit get(context) => BlocProvider.of(context);

  int? currentIndex= 0 ;
  Widget currentScreen = const HomeViewBody();
  final PageStorageBucket bucket = PageStorageBucket();
  List<Widget> screens = [
    const HomeViewBody(),
    const HomeViewBody(),
    const HomeViewBody(),
    const HomeViewBody(),

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
    }
  }
  changeCurrentIndex(int index){
    currentIndex = index;
    emit(ChangeCurrentIndex());
  }
/* get slider image */
  SliderModel? sliderModel;
  Future<void>  getSliderData() async{
    emit(SliderHomeLoading()) ;

    var result = await homeRepo.getSliderData();

    result.fold((failure) {
      emit(SliderHomeError());
    }, (sliderModel) {
      this.sliderModel= sliderModel;
      getStringFromSliders();
      emit(SliderHomeSuccess(sliderModel));
    });
  }
  List<String> images = [];
  int index = 0 ;
  getStringFromSliders(){
    for(int i = 0 ; i < sliderModel!.data!.sliders!.length ; i++){
      images.add(sliderModel!.data!.sliders![i].image!);
    }
    index =   sliderModel!.data!.sliders!.length ;
  }


 /*get best seller */
  BestSellerModel? bestSellerModel;
  Future<void>  getBestSellerData() async{
    emit(BestSellerHomeLoading()) ;

    var result = await homeRepo.getBestSellerData();

    result.fold((failure) {
      emit(BestSellerHomeError());
    }, (bestSellerModel) {
      this.bestSellerModel= bestSellerModel;
      getAllDataForBestSeller();
      emit(BestSellerHomeSuccess(bestSellerModel));
    });
  }

   List<String> imageBook =[] ;
   List<String> nameBook=[] ;
   List<String> categoryBook =[];
   List<String> priceBeforeBook =[];
   List<double> priceAfterBook=[] ;
   List<int> discountBook =[];
   int lengthBestSeller = 0 ;
  getAllDataForBestSeller(){
    for(int i = 0 ; i < bestSellerModel!.data!.products!.length ; i++){
      imageBook.add(bestSellerModel!.data!.products![i].image!);
      nameBook.add(bestSellerModel!.data!.products![i].name!);
      categoryBook.add(bestSellerModel!.data!.products![i].category!);
      priceBeforeBook.add(bestSellerModel!.data!.products![i].price!);
      priceAfterBook.add(bestSellerModel!.data!.products![i].priceAfterDiscount!);
      discountBook.add(bestSellerModel!.data!.products![i].discount!);
    }
    lengthBestSeller = bestSellerModel!.data!.products!.length;

  }






  /* get category */
 CategoryModel? categoryModel;
  Future<void>  getCategoryData() async{
    emit(CategoryHomeLoading()) ;
    var result = await homeRepo.getCategoryData();
    result.fold((failure) {
      emit(CategoryHomeError());
    }, (categoryModel) {
      this.categoryModel= categoryModel;
      getCategory();
      emit(CategoryHomeSuccess(categoryModel));
    });
  }
  List<String> categories=[];
  int lengthCategory = 0 ;
  getCategory(){
    for(int i = 0 ; i < categoryModel!.data!.categories!.length; i++){
      categories.add(categoryModel!.data!.categories![i].name!);
    }
    lengthCategory = categoryModel!.data!.categories!.length;

  }




  /*get New Arrival*/

  NewArrivalModel? newArrivalModel;
  Future<void>  getNewArrivalData() async{
    emit(NewArrivalHomeLoading()) ;

    var result = await homeRepo.getNewArrivalData();

    result.fold((failure) {
      emit(NewArrivalHomeError());
    }, (newArrivalModel) {
      this.newArrivalModel= newArrivalModel;
      getAllDataForNewArrival();
      emit(NewArrivalHomeSuccess(newArrivalModel));
    });
  }

  List<String> imageBookNewArrival =[] ;
  List<String> nameBookNewArrival=[] ;
  List<String> categoryBookNewArrival =[];
  List<String> priceBeforeBookNewArrival =[];
  List<double> priceAfterBookNewArrival=[] ;
  List<int> discountBookNewArrival =[];
  int lengthNewArrival = 0 ;
  getAllDataForNewArrival(){
    for(int i = 0 ; i < newArrivalModel!.data!.products!.length ; i++){
      imageBookNewArrival.add(newArrivalModel!.data!.products![i].image!);
      nameBookNewArrival.add(newArrivalModel!.data!.products![i].name!);
      categoryBookNewArrival.add(newArrivalModel!.data!.products![i].category!);
      priceBeforeBookNewArrival.add(newArrivalModel!.data!.products![i].price!);
      priceAfterBookNewArrival.add(newArrivalModel!.data!.products![i].priceAfterDiscount!);
      discountBookNewArrival.add(newArrivalModel!.data!.products![i].discount!);
    }
    lengthNewArrival = newArrivalModel!.data!.products!.length;

  }


}
