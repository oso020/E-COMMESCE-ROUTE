import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/data_source/product_data_source.dart';

import 'package:ecommerce/domain/entites/ProductResponseEntity.dart';

import 'package:ecommerce/domain/faluires.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repo/productRepo.dart';
@Injectable(as: ProductRepo)
class ProductRepoImpl implements ProductRepo{
  ProductDataSource productDataSource;
  ProductRepoImpl({required this.productDataSource});
  @override
  Future<Either<Failures, ProductResponseEntity>> getAllProduct()async {
    var either= await productDataSource.getAllProduct();

    return either.fold((l) => Left(l), (r) => Right(r),);
  }

}