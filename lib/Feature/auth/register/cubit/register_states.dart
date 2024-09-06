



import '../../../../domain/entites/RegisterResponseEntity.dart';
import '../../../../domain/faluires.dart';

abstract class RegisterStates{}

class RegisterStateBegin extends RegisterStates{}

class RegisterStateLoading extends RegisterStates{}
class RegisterStateSuccess extends RegisterStates{
  RegisterResponseEntity registerResponseEntity;
  RegisterStateSuccess({
    required this.registerResponseEntity
  });
}
class RegisterStateError extends RegisterStates{
  Failures failures;
  RegisterStateError({
    required this.failures
  });
}
