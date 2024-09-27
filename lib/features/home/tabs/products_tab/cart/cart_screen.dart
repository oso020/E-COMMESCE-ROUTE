import 'package:e_commerce_app/core/resources/style_manager.dart';
import 'package:e_commerce_app/core/widgets/cart_iconButton.dart';
import 'package:e_commerce_app/features/home/tabs/products_tab/cart/cart_item_widget.dart';
import 'package:e_commerce_app/features/home/tabs/products_tab/cart/cubit/cart_screen_cubit.dart';
import 'package:e_commerce_app/features/home/tabs/products_tab/cart/cubit/cart_screen_states.dart';
import 'package:e_commerce_app/features/home/tabs/products_tab/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/font_manager.dart';
import '../cubit/products_tab_cubit.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartScreenViewModel, CartScreenState>(
      bloc: CartScreenViewModel.get(context)..getCart(),
      builder: (context, state) {
        if (state is SuccessCartScreenState ) {
          return Scaffold(
            backgroundColor: ColorManager.white,
            appBar: AppBar(
              backgroundColor: ColorManager.white,
              elevation: 0,
              centerTitle: true,
              title: Text(
                "Cart",
                style: getTextStyle(
                    20, FontWeightManager.bold, ColorManager.darkBlue),
              ),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: ColorManager.darkBlue,
                    )),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: CartIconbutton(
                    numOfCart: state.getCartResponseEntity.numOfCartItems!.toInt()
                  ),
                )
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount:
                        CartScreenViewModel.get(context).cartProducts.length,
                        itemBuilder: (context, index) {
                          return CartItemWidget(
                            productEntity: CartScreenViewModel.get(context).cartProducts[index],
                          );
                        }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //total price
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total Price",
                            style: getTextStyle(
                              18,
                              FontWeightManager.medium,
                              ColorManager.grey,
                            ),
                          ),
                          Text(
                            "EGP ${ProductDetailsScreen.formatNumber(state.getCartResponseEntity.data!.totalCartPrice!.toInt())}",
                            style: getTextStyle(
                              18,
                              FontWeightManager.medium,
                              ColorManager.primary,
                            ),
                          ),
                        ],
                      ),
                      //add to cart button
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 230,
                          height: 48,
                          decoration: BoxDecoration(
                              color: ColorManager.primary,
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Check out",
                                style: getTextStyle(
                                  18,
                                  FontWeightManager.bold,
                                  ColorManager.white,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_rounded,
                                color: ColorManager.white,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        } else if (state is ErrorCartScreenState) {
          return Center(
            child: Text(
              state.failure.errorMessage,
              style: getTextStyle(
                  18, FontWeightManager.medium, ColorManager.darkBlue),
            ),
          );
        }
        return Scaffold(
            backgroundColor: ColorManager.white,
            body: Center(
              child: CircularProgressIndicator(
                color: ColorManager.primary,
              ),
            ));
      },
    );
  }
}
