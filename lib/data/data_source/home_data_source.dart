import 'package:dartz/dartz.dart';

import '../../domain/entites/CategoryResponseEntity.dart';
import '../../domain/faluires.dart';

abstract class HomeDataSource{
  Future<Either<Failures,CategoryOrBrandResponseEntity>> getAllCategory();
  Future<Either<Failures,CategoryOrBrandResponseEntity>> getAllBrandes();

}