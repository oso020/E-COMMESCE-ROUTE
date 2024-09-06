



import '../../../../domain/entites/LoginResponseEntity.dart';
import '../../../../domain/entites/LoginResponseEntity.dart';
import '../../../../domain/entites/LoginResponseEntity.dart';
import '../../../../domain/faluires.dart';

abstract class LoginStates{}

class LoginStateBegin extends LoginStates{}

class LoginStateLoading extends LoginStates{}
class LoginStateSuccess extends LoginStates{
  LoginResponseEntity loginResponseEntity;
  LoginStateSuccess({
    required this.loginResponseEntity
  });
}
class LoginStateError extends LoginStates{
  Failures failures;
  LoginStateError({
    required this.failures
  });
}
