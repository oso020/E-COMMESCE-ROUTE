import 'package:dartz/dartz.dart';

import '../../domain/entites/ProductResponseEntity.dart';
import '../../domain/faluires.dart';

abstract class ProductDataSource{

  Future<Either<Failures,ProductResponseEntity>> getAllProduct();
}