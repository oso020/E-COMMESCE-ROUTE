import 'package:e_commerce_app/domain/entity_models/SignUpResponseEntity.dart';

import '../../../../domain/failures.dart';

abstract class SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignUpErrorState extends SignUpState {
  Failure failure;

  SignUpErrorState({required this.failure});
}

class SignUpSuccessState extends SignUpState {
  SignUpResponseEntity signUpResponse;

  SignUpSuccessState({required this.signUpResponse});
}
