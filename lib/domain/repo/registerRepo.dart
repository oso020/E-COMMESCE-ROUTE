import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/faluires.dart';

import '../entites/RegisterResponseEntity.dart';


abstract class RegisterRepo {
  Future<Either<Failures, RegisterResponseEntity>> register(String name,
      String email, String password, String rPassword, String phone);
}
