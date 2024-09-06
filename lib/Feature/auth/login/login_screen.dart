import 'package:ecommerce/Feature/auth/login/cubit/login_view_model.dart';
import 'package:ecommerce/Feature/auth/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets_and_functions/TextFieldCustom.dart';
import '../../../core/widgets_and_functions/dialog_model.dart';
import '../../../di/di.dart';

import '../../Home/home.dart';
import '../register/cubit/register_states.dart';
import '../register/cubit/register_view_model.dart';
import 'cubit/login_states.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "login_screen";

  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginViewModel loginViewModel = getIt<LoginViewModel>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    loginViewModel.password.dispose();
    loginViewModel.email.dispose();

  }

  final form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xff004182),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocProvider<LoginViewModel>(
          create: (context) => loginViewModel,
          child: BlocListener<LoginViewModel, LoginStates>(
            listener: (context, state) {
              if (state is LoginStateSuccess) {
                DailogUtils.hideLoading(context);
                DailogUtils.showMessage(
                    context: context,
                    color: Colors.white,
                    content: "Login Successfully",
                    title: "Success",
                    button1Name: "ok",
                    button1Function: (){
                      Navigator.pushNamed(context, HomeScreen.routeName);
                    }
                );
              } else if (state is LoginStateError) {
                DailogUtils.hideLoading(context);
                DailogUtils.showMessage(
                    context: context,
                    color: Colors.white,
                    content: state.failures.errorMessage,
                    title: "Error",
                    button1Name: "ok");
              } else {
                DailogUtils.showLoading(context, Colors.white, "Loading");
              }
            },
            child: Form(
              key: form,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: height / 6,
                    ),
                    Image.asset("assets/images/logo.png"),
                    SizedBox(
                      height: height / 25,
                    ),
                    Text("Welcome Back To Route"),
                    Text("Please sign in with your mail"),
                    SizedBox(
                      height: height / 80,
                    ),
                    Text("E-mail address"),
                    Textfieldcustom(
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return "Enter your email";
                        }
                        final bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(text);

                        if (!emailValid) {
                          return "enter valid email";
                        }
                        return null;
                      },
                      controller: loginViewModel.email,
                      lableText: "email",
                    ),
                    SizedBox(
                      height: height / 80,
                    ),
                    Text("password"),
                    Textfieldcustom(
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return "enter your password";
                        }

                        final bool regex = RegExp(
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                            .hasMatch(text);
                        if (!regex) {
                          return "enter valid password";
                        }
                        return null;
                      },
                      controller: loginViewModel.password,
                      lableText: "password",
                    ),
                    SizedBox(
                      height: height / 80,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () {
                            if (form.currentState!.validate()) {
                              loginViewModel.login();
                            }
                          },
                          child: Text("login")),
                    ),
                    InkWell(
                      onTap: (){
                    Navigator.pushNamed(context, RegisterScreen.routeName);
                      },
                        child: Text("Create account?",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white
                        ),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
