import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entites/ProductResponseEntity.dart';
import 'package:ecommerce/domain/faluires.dart';

abstract class ProductRepo{
 Future<Either<Failures,ProductResponseEntity>> getAllProduct();
}