part of 'layout_cubit.dart';

@immutable
abstract class LayoutState {}

class HomeInitial extends LayoutState {}
class SliderHomeLoading extends LayoutState {}
class SliderHomeSuccess extends LayoutState {
  final SliderModel sliderModel ;

  SliderHomeSuccess(this.sliderModel);
}
class SliderHomeError extends LayoutState {}

class BestSellerHomeLoading extends LayoutState {}
class BestSellerHomeSuccess extends LayoutState {
  final BestSellerModel bestSellerModel ;

  BestSellerHomeSuccess(this.bestSellerModel);
}
class BestSellerHomeError extends LayoutState {}

class CategoryHomeLoading extends LayoutState {}
class CategoryHomeSuccess extends LayoutState {
  final CategoryModel categoryModel ;

  CategoryHomeSuccess(this.categoryModel);
}
class CategoryHomeError extends LayoutState {}

class NewArrivalHomeLoading extends LayoutState {}
class NewArrivalHomeSuccess extends LayoutState {
  final NewArrivalModel newArrivalModel ;

  NewArrivalHomeSuccess(this.newArrivalModel);
}
class NewArrivalHomeError extends LayoutState {}


class ChangeCurrentIndex extends LayoutState {}
class ChangeCurrentScreen extends LayoutState {}
