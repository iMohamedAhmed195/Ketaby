part of 'cart_cubit.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class GetAllCartLoading  extends CartState {}
class GetAllCartSuccess extends CartState {
  final  GetAllCartModel getAllCartModel;

  GetAllCartSuccess(this.getAllCartModel);
}
class GetAllCartError extends CartState {}
class DeleteFromCartSuccess extends CartState {
  final  DeleteItemCartModel deleteItemCartModel;

  DeleteFromCartSuccess(this.deleteItemCartModel);
}
class DeleteFromCartError extends CartState {}

class ChangeNumberOfBooksInCart extends CartState {}
