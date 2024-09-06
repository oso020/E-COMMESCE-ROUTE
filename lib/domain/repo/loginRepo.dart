import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entites/LoginResponseEntity.dart';
import 'package:ecommerce/domain/faluires.dart';

abstract class LoginRepo{
  Future<Either<Failures,LoginResponseEntity>> login(String email,String password);
}