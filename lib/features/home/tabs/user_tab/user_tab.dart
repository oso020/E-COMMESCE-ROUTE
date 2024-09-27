import 'package:e_commerce_app/core/resources/color_manager.dart';
import 'package:e_commerce_app/features/shared_preferences_utils.dart';
import 'package:flutter/material.dart';

import '../../../../core/routes_manager/routes.dart';

class UserTab extends StatelessWidget {
  const UserTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
              onPressed: () {
                SharedPreferencesUtils.removeDate(key: 'token');
                Navigator.pushNamedAndRemoveUntil(
                    context, Routes.signInScreenRoute, (route) => false);
              },
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(ColorManager.primary),
                  foregroundColor: WidgetStatePropertyAll(ColorManager.white),
                  shape: WidgetStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.logout),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "Log out",
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
