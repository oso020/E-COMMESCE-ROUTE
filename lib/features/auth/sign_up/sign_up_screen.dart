import 'package:e_commerce_app/core/resources/assets_manager.dart';
import 'package:e_commerce_app/core/resources/color_manager.dart';
import 'package:e_commerce_app/core/routes_manager/routes.dart';
import 'package:e_commerce_app/core/widgets/DialogUtils.dart';
import 'package:e_commerce_app/core/widgets/custom_elevated_button.dart';
import 'package:e_commerce_app/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce_app/core/widgets/validators/app_validators.dart';
import 'package:e_commerce_app/features/auth/sign_up/sign_up_cubit/sign_up_cubit.dart';
import 'package:e_commerce_app/features/auth/sign_up/sign_up_cubit/sign_up_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/resources/font_manager.dart';
import '../../../core/resources/style_manager.dart';
import '../../../di/di.dart';

class SignUpScreen extends StatelessWidget {
  SignUpViewModel signUpViewModel = getIt<SignUpViewModel>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpViewModel, SignUpState>(
      bloc: signUpViewModel,
      listener: (context, state) {
        if (state is SignUpLoadingState) {
          return DialogUtils.showLoading(
              context: context, message: "Loading...");
        } else if (state is SignUpErrorState) {
          DialogUtils.hideLoading(context);
          return DialogUtils.showMessage(
              context: context,
              message: state.failure.errorMessage,
              title: "Error",
              posActionName: "Ok");
        } else if (state is SignUpSuccessState) {
          DialogUtils.hideLoading(context);
          return DialogUtils.showMessage(
              context: context,
              title: "Success",
              message: "Registered Successfully.",
              posActionName: "Ok",
          posAction: (){
                Navigator.pushNamed(context, Routes.homeScreenRoute);
          }
          );
        }
      },
      child: Scaffold(
        backgroundColor: ColorManager.primary,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Form(
                key: signUpViewModel.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset(
                      ImageAsset.routeLogo,
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    //full name
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Full Name",
                        style: getTextStyle(
                          18.0,
                          FontWeightManager.medium,
                          ColorManager.white,
                        ),
                      ),
                    ),
                    CustomTextFormField(
                        hint: "enter your full name",
                        validator: (val) => AppValidators.validateFullName(val),
                        controller: signUpViewModel.nameController),

                    //mobile number
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Mobile Number",
                        style: getTextStyle(
                          18.0,
                          FontWeightManager.medium,
                          ColorManager.white,
                        ),
                      ),
                    ),
                    CustomTextFormField(
                      hint: "enter your mobile no",
                      validator: (val) =>
                          AppValidators.validatePhoneNumber(val),
                      controller: signUpViewModel.phoneController,
                      keyboardType: TextInputType.number,
                    ),

                    //emial
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "E-mail address",
                        style: getTextStyle(
                          18.0,
                          FontWeightManager.medium,
                          ColorManager.white,
                        ),
                      ),
                    ),
                    CustomTextFormField(
                      hint: "enter your email address",
                      validator: (val) => AppValidators.validateEmail(val),
                      controller: signUpViewModel.emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),

                    //password
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Password",
                        style: getTextStyle(
                          18.0,
                          FontWeightManager.medium,
                          ColorManager.white,
                        ),
                      ),
                    ),
                    CustomTextFormField(
                      hint: "enter your password",
                      validator: (val) => AppValidators.validatePassword(val),
                      controller: signUpViewModel.passwordController,
                      isSecured: true,
                    ),

                    //confirm password
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Confirm Password",
                        style: getTextStyle(
                          18.0,
                          FontWeightManager.medium,
                          ColorManager.white,
                        ),
                      ),
                    ),
                    CustomTextFormField(
                      hint: "confirm password",
                      validator: (val) => AppValidators.validateConfirmPassword(
                          val, signUpViewModel.passwordController),
                      controller: signUpViewModel.confirmPasswordController,
                      isSecured: true,
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    CustomElevatedButton(
                        text: "Sign Up",
                        onButtonClicked: () {
                          signUpViewModel.signUp();
                        })
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
