import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entity_models/SignUpResponseEntity.dart';
import 'package:e_commerce_app/domain/failures.dart';

import '../entity_models/SignInRsponseEntity.dart';

abstract class AuthRepository {
  Future<Either<Failure, SignUpResponseEntity>> signUp(String name,
      String phone, String email, String password, String confirmPassword);

  Future<Either<Failure, SignInResponseEntity>> signIn(
      String email, String password);
}
