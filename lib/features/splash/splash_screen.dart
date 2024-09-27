import 'dart:async';

import 'package:e_commerce_app/core/resources/assets_manager.dart';
import 'package:flutter/material.dart';

import '../../core/routes_manager/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, Routes.signInScreenRoute);
    });
    return Scaffold(
      body: Image.asset(
        ImageAsset.splash,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
