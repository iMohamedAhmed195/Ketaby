import 'package:dartz/dartz.dart';
import 'package:ketab/core/error/failure.dart';
import 'package:ketab/features/cart_feature/data/cart_model/delete_item_from_cart.dart';
import 'package:ketab/features/cart_feature/data/cart_model/get_cart_data_model.dart';

abstract class CartRepo{
  Future<Either<ServerFailure , GetAllCartModel>>  getAllCart();
  Future<Either<ServerFailure , DeleteItemCartModel>>  deleteItemFromCart(int bookId);
}