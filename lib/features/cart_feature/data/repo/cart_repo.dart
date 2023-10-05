import 'package:dartz/dartz.dart';
import 'package:ketab/core/error/failure.dart';
import 'package:ketab/features/cart_feature/data/cart_model/get_cart_data_model.dart';

abstract class CartRepo{
  Future<Either<ServerFailure , GetAllCartModel>>  getAllCart();
}