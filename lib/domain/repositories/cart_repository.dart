import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entity_models/GetCartResponseEntity.dart';
import 'package:e_commerce_app/domain/failures.dart';

abstract class CartRepository {
  Future<Either<Failure, GetCartResponseEntity>> getCart();
  Future<Either<Failure, GetCartResponseEntity>> deleteItem(String productId);
  Future<Either<Failure, GetCartResponseEntity>> updateItem(int count,String productId);
}
