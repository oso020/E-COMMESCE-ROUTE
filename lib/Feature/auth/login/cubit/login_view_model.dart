import 'package:bloc/bloc.dart';
import 'package:ecommerce/domain/use_cases/use_case_login.dart';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';


import 'login_states.dart';


@injectable
class LoginViewModel extends Cubit<LoginStates> {
 LoginUseCase loginUseCase;
 LoginViewModel({required this.loginUseCase})
      : super(LoginStateBegin());

 

  TextEditingController email = TextEditingController(text: "osman54@gmail.com");

  TextEditingController password = TextEditingController(text: "Mm#123456");



  void login() async {
    emit(LoginStateLoading());
    var either=await loginUseCase.invoke(
         email.text, password.text );

    either.fold((l) {
      emit(LoginStateError(failures: l));
    }, (r) {
      emit(LoginStateSuccess( loginResponseEntity: r));
    },);


  }
}
