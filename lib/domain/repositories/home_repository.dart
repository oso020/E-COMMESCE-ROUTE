import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entity_models/CategoryResponseEntity.dart';

import '../entity_models/AddToCartResponseEntity.dart';
import '../entity_models/BrandResponseEntity.dart';
import '../entity_models/ProductResponseEntity.dart';
import '../failures.dart';

abstract class HomeRepository {
  Future<Either<Failure, CategoryResponseEntity>> getAllCategories();

  Future<Either<Failure, BrandResponseEntity>> getAllBrands();

  Future<Either<Failure, ProductResponseEntity>> getAllProducts();

  Future<Either<Failure, AddToCartResponseEntity>> addToCart(String productId);
}
