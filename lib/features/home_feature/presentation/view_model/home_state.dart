part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class SliderHomeLoading extends HomeState {}
class SliderHomeSuccess extends HomeState {
  final SliderModel sliderModel ;

  SliderHomeSuccess(this.sliderModel);
}
class SliderHomeError extends HomeState {}

class BestSellerHomeLoading extends HomeState {}
class BestSellerHomeSuccess extends HomeState {
  final BestSellerModel bestSellerModel ;

  BestSellerHomeSuccess(this.bestSellerModel);
}
class BestSellerHomeError extends HomeState {}

class CategoryHomeLoading extends HomeState {}
class CategoryHomeSuccess extends HomeState {
  final CategoryModel categoryModel ;

  CategoryHomeSuccess(this.categoryModel);
}
class CategoryHomeError extends HomeState {}

class NewArrivalHomeLoading extends HomeState {}
class NewArrivalHomeSuccess extends HomeState {
  final NewArrivalModel newArrivalModel ;

  NewArrivalHomeSuccess(this.newArrivalModel);
}
class NewArrivalHomeError extends HomeState {}


class ChangeCurrentIndex extends HomeState {}
class ChangeCurrentScreen extends HomeState {}
