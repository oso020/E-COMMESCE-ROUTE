import 'package:dartz/dartz.dart';

import '../../domain/entity_models/SignInRsponseEntity.dart';
import '../../domain/entity_models/SignUpResponseEntity.dart';
import '../../domain/failures.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failure, SignUpResponseEntity>> signUp(String name,
      String phone, String email, String password, String confirmPassword);

  Future<Either<Failure, SignInResponseEntity>> signIn(
      String email, String password);
}
