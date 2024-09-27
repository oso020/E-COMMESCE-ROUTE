import 'package:e_commerce_app/features/auth/sign_up/sign_up_cubit/sign_up_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/use_cases/sign_up_use_case.dart';

@injectable
class SignUpViewModel extends Cubit<SignUpState> {
  SignUpUseCase signUpUseCase;

  SignUpViewModel({required this.signUpUseCase}) : super(SignUpLoadingState());
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  void signUp() async {
    if (formKey.currentState?.validate() == true) {
      emit(SignUpLoadingState());
      var either = await signUpUseCase.invoke(
        nameController.text,
        phoneController.text,
        emailController.text,
        passwordController.text,
        confirmPasswordController.text,
      );
      either.fold((error) {
        emit(SignUpErrorState(failure: error));
      }, (response) {
        emit(SignUpSuccessState(signUpResponse: response));
      });
    }
  }
}
