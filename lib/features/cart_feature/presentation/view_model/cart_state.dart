part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class GetAllCartLoading  extends CartState {}
class GetAllCartSuccess extends CartState {
  final  GetAllCartModel getAllCartModel;

  GetAllCartSuccess(this.getAllCartModel);
}
class GetAllCartError extends CartState {}
