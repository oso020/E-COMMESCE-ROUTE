import '../../../../domain/entity_models/SignInRsponseEntity.dart';
import '../../../../domain/failures.dart';

abstract class SignInState {}

class SignInLoadingState extends SignInState {}

class SignInErrorState extends SignInState {
  Failure failure;

  SignInErrorState({required this.failure});
}

class SignInSuccessState extends SignInState {
  SignInResponseEntity signInResponse;

  SignInSuccessState({required this.signInResponse});
}
