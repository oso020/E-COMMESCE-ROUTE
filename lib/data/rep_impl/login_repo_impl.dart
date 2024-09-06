import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/data_source/login_data_soure.dart';
import 'package:ecommerce/domain/entites/LoginResponseEntity.dart';
import 'package:ecommerce/domain/faluires.dart';
import 'package:ecommerce/domain/repo/loginRepo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: LoginRepo)

class LoginRepoImpl implements LoginRepo{
  LoginDataSource loginDataSource;
  LoginRepoImpl({required this.loginDataSource});
  @override
  Future<Either<Failures, LoginResponseEntity>> login(String email, String password)async {
  var response= await loginDataSource.login(email,password);

  return response.fold((error) => Left(error), (response) =>Right(response) ,);
  }
  
}