import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/data_sources/home_remote_data_source.dart';
import 'package:e_commerce_app/domain/entity_models/AddToCartResponseEntity.dart';
import 'package:e_commerce_app/domain/entity_models/BrandResponseEntity.dart';
import 'package:e_commerce_app/domain/entity_models/CategoryResponseEntity.dart';
import 'package:e_commerce_app/domain/entity_models/ProductResponseEntity.dart';
import 'package:e_commerce_app/domain/failures.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/home_repository.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl({required this.homeRemoteDataSource});

  @override
  Future<Either<Failure, CategoryResponseEntity>> getAllCategories() async {
    var either = await homeRemoteDataSource.getAllCategories();
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failure, BrandResponseEntity>> getAllBrands() async {
    var either = await homeRemoteDataSource.getAllBrands();
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failure, ProductResponseEntity>> getAllProducts() async {
    var either = await homeRemoteDataSource.getAllProducts();
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failure, AddToCartResponseEntity>> addToCart(
      String productId) async {
    var either = await homeRemoteDataSource.addToCart(productId);
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
