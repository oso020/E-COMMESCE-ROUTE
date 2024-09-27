import 'package:e_commerce_app/features/auth/sign_in/sign_in_cubit/sign_in_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/use_cases/sign_in_use_case.dart';

@injectable
class SignInViewModel extends Cubit<SignInState> {
  SignInUseCase signInUseCase;

  SignInViewModel({required this.signInUseCase}) : super(SignInLoadingState());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  void signIn() async {
    if (formKey.currentState?.validate() == true) {
      emit(SignInLoadingState());
      var either = await signInUseCase.invoke(
        emailController.text,
        passwordController.text,
      );
      either.fold((error) {
        emit(SignInErrorState(failure: error));
      }, (response) {
        emit(SignInSuccessState(signInResponse: response));
      });
    }
  }
}
