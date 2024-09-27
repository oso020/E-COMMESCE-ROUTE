import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entity_models/SignUpResponseEntity.dart';
import 'package:injectable/injectable.dart';

import '../failures.dart';
import '../repositories/auth_repository.dart';

@injectable
class SignUpUseCase {
  AuthRepository signUpRepository;

  SignUpUseCase({required this.signUpRepository});

  Future<Either<Failure, SignUpResponseEntity>> invoke(String name,
      String phone, String email, String password, String confirmPassword) {
    return signUpRepository.signUp(
        name, phone, email, password, confirmPassword);
  }
}
