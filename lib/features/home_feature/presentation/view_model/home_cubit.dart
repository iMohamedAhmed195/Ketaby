
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

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());

  final HomeRepo homeRepo ;



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
   List<String> description=[] ;
   List<int> bookId=[] ;
   List<num> priceAfterBook=[] ;
   List<num> discountBook =[];
   int lengthBestSeller = 0 ;
  getAllDataForBestSeller(){
    for(int i = 0 ; i < bestSellerModel!.data!.products!.length ; i++){
      imageBook.add(bestSellerModel!.data!.products![i].image!);
      nameBook.add(bestSellerModel!.data!.products![i].name!);
      categoryBook.add(bestSellerModel!.data!.products![i].category!);
      priceBeforeBook.add(bestSellerModel!.data!.products![i].price!);
      priceAfterBook.add(bestSellerModel!.data!.products![i].priceAfterDiscount!);
      discountBook.add(bestSellerModel!.data!.products![i].discount!);
      description.add(bestSellerModel!.data!.products![i].description!);
      bookId.add(bestSellerModel!.data!.products![i].id!);
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
  List<String> descriptionNewArrival =[];
  List<int> bookIdArrival =[];
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
      descriptionNewArrival.add(newArrivalModel!.data!.products![i].description!);
      bookIdArrival.add(newArrivalModel!.data!.products![i].id!);
    }
    lengthNewArrival = newArrivalModel!.data!.products!.length;

  }


}
