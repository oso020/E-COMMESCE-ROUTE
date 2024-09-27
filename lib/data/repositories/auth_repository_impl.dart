import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/data_sources/auth_remote_data_source.dart';
import 'package:e_commerce_app/domain/entity_models/SignInRsponseEntity.dart';
import 'package:e_commerce_app/domain/entity_models/SignUpResponseEntity.dart';
import 'package:e_commerce_app/domain/failures.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/auth_repository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  // store data of response => Either failure or success
  AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failure, SignUpResponseEntity>> signUp(
      String name,
      String phone,
      String email,
      String password,
      String confirmPassword) async {
    var either = await authRemoteDataSource.signUp(
        name, phone, email, password, confirmPassword);
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failure, SignInResponseEntity>> signIn(
      String email, String password) async {
    var either = await authRemoteDataSource.signIn(email, password);
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
