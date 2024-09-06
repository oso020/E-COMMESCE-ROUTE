
import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entites/CategoryResponseEntity.dart';
import 'package:ecommerce/domain/faluires.dart';

abstract class HomeRepo {
  Future<Either<Failures,CategoryOrBrandResponseEntity>> getAllCategory();
  Future<Either<Failures,CategoryOrBrandResponseEntity>> getAllBrandes();
}