import 'package:e_commerce_app/core/widgets/cart_iconButton.dart';
import 'package:e_commerce_app/features/home/tabs/products_tab/cubit/products_tab_cubit.dart';
import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/style_manager.dart';

class SearchBarRow extends StatelessWidget {
  const SearchBarRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              border: Border.all(
                color: ColorManager.primary,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.search_sharp,
                  color: ColorManager.primary,
                  size: 25,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "What do you search for?",
                      border: InputBorder.none,
                      hintStyle: getTextStyle(
                        14.0,
                        FontWeightManager.light,
                        ColorManager.darkGrey,
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      fillColor: Colors.white24,
                      filled: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        CartIconbutton(
          numOfCart: ProductsTabViewModel.get(context).numOfCartItems,
        ),
      ],
    );
  }
}
