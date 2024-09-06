import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/repo/registerRepo.dart';
import 'package:injectable/injectable.dart';

import '../entites/RegisterResponseEntity.dart';
import '../faluires.dart';
@injectable
class RegisterUseCase{
  RegisterRepo registerRepo;
  RegisterUseCase({required this.registerRepo});

  Future<Either<Failures, RegisterResponseEntity>> invoke(String name,
      String email, String password, String rPassword, String phone){
   return registerRepo.register(name, email, password, rPassword, phone);
  }
}