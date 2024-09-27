import 'package:flutter/material.dart';

import '../../features/home/tabs/products_tab/cubit/products_tab_cubit.dart';
import '../resources/color_manager.dart';
import '../routes_manager/routes.dart';

class CartIconbutton extends StatelessWidget {
  final int numOfCart;
  const CartIconbutton({super.key, required this.numOfCart});

  @override
  Widget build(BuildContext context) {
    return Badge(
      label: Text("${numOfCart}"),
      child: IconButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.cartScreenRoute);
        },
        icon: Icon(
          Icons.shopping_cart_outlined,
          size: 30,
          color: ColorManager.primary,
        ),
      ),
    );
  }
}
