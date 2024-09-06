import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entites/LoginResponseEntity.dart';
import 'package:ecommerce/domain/repo/loginRepo.dart';
import 'package:injectable/injectable.dart';

import '../faluires.dart';
@injectable
class LoginUseCase{
  LoginRepo loginRepo;
  LoginUseCase({required this.loginRepo});

  Future<Either<Failures, LoginResponseEntity>> invoke(String email ,String password)async{
    var response=await loginRepo.login(email, password);
    return response;
  }
}