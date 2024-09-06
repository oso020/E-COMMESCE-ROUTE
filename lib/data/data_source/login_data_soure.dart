import 'package:dartz/dartz.dart';

import '../../domain/entites/LoginResponseEntity.dart';
import '../../domain/faluires.dart';

abstract  class LoginDataSource{

  Future<Either<Failures,LoginResponseEntity>> login(String email,String password);

}