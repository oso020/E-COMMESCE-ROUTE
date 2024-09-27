import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entity_models/SignInRsponseEntity.dart';
import '../failures.dart';
import '../repositories/auth_repository.dart';

@injectable
class SignInUseCase {
  AuthRepository signInRepository;

  SignInUseCase({required this.signInRepository});

  Future<Either<Failure, SignInResponseEntity>> invoke(
      String email, String password) {
    return signInRepository.signIn(email, password);
  }
}
