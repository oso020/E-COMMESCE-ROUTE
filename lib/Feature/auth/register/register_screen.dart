import 'package:ecommerce/Feature/Home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets_and_functions/TextFieldCustom.dart';
import '../../../core/widgets_and_functions/dialog_model.dart';
import '../../../di/di.dart';

import 'cubit/register_states.dart';
import 'cubit/register_view_model.dart';




class RegisterScreen extends StatefulWidget {
  static const String routeName = "register_screen";

  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterViewModel registerViewModel = getIt<RegisterViewModel>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    registerViewModel.userName.dispose();
    registerViewModel.password.dispose();
    registerViewModel.email.dispose();
    registerViewModel.rPassword.dispose();
  }

  final form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor:Color(0xff004182) ,
      appBar: AppBar(
        backgroundColor:Color(0xff004182) ,

      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocProvider<RegisterViewModel>(
          create: (context) => registerViewModel,
          child: BlocListener<RegisterViewModel, RegisterStates>(


            listener: (context, state) {
              if (state is RegisterStateSuccess) {
                DailogUtils.hideLoading(context);
                DailogUtils.showMessage(
                    context: context,
                    color: Colors.white,
                    content: "Register Successfully",
                    title: "Success",
                    button1Name: "ok",
                  button1Function: (){
                      Navigator.pushNamed(context, HomeScreen.routeName);
                  }
                );
              }else if (state is RegisterStateError) {
                DailogUtils.hideLoading(context);
                DailogUtils.showMessage(
                    context: context,
                    color: Colors.white,
                    content: state.failures.errorMessage,
                    title: "Error",
                    button1Name: "ok"
                );
              }else{
                DailogUtils.showLoading(context, Colors.white,"Loading");

              }
            },
          child: Form(
            key: form,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: height /30,
                  ),
                  Image.asset("assets/images/logo.png"),
                  SizedBox(
                    height: height /25,
                  ),
                  Text("Full Name"),
              SizedBox(
              height: height / 80,
            ),
                  Textfieldcustom(
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return "enter your name";
                      }
                      return null;
                    },
                    controller: registerViewModel.userName,
                    lableText: "user",
                  ),
                  SizedBox(
                    height: height / 80,
                  ),
                  Text("Mobile Number"),

                  Textfieldcustom(
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return "enter phone please:";
                      }
                      if(text.length != 11){
                        return "enter 11 digits Please";
                      }
                      return null;
                    },
                    controller: registerViewModel.phone,
                    lableText: "enter phone",
                  ),
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
                    controller: registerViewModel.email,
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
                    controller: registerViewModel.password,
                    lableText: "password",
                  ),
                  SizedBox(
                    height: height / 80,
                  ),
                  Text("confirm password"),

                  Textfieldcustom(
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return "enter confirm password";
                      }
                      if (text != registerViewModel.password.text) {
                        return "password dont match";
                      }
                      return null;
                    },
                    controller: registerViewModel.rPassword,
                    lableText:
                    "confirm password",
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {
                          if (form.currentState!.validate()) {
                            registerViewModel.register();


                          }
                        },
                        child:
                        Text("register")),
                  )
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
