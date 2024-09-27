import 'package:e_commerce_app/core/resources/color_manager.dart';
import 'package:e_commerce_app/core/resources/font_manager.dart';
import 'package:e_commerce_app/core/resources/style_manager.dart';
import 'package:e_commerce_app/domain/entity_models/GetCartResponseEntity.dart';
import 'package:flutter/material.dart';

import 'cubit/cart_screen_cubit.dart';

class CartItemWidget extends StatelessWidget {
  GetProductsCartEntity productEntity;

  CartItemWidget({required this.productEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Container(
        width: 398,
        height: 113,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: ColorManager.primary, width: 1.5),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(13.5),
              child: Image.network(
                productEntity.product!.imageCover!,
                width: 120,
                height: 113,
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 3),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            productEntity.product!.title!,
                            style: getTextStyle(17, FontWeightManager.medium,
                                ColorManager.darkBlue),
                            maxLines: 1, // Limit to one line
                            overflow:
                                TextOverflow.ellipsis, // Truncate with ellipsis
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            CartScreenViewModel.get(context).deleteItemCart(productEntity.product!.id??"");
                          },
                          icon: Icon(
                            Icons.delete_outline,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "EGP ${productEntity.price}",
                          style: getTextStyle(16, FontWeightManager.medium,
                              ColorManager.darkBlue),
                        ),
                        Container(
                          width: 122,
                          height: 42,
                          decoration: BoxDecoration(
                            color: ColorManager.primary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Icon(Icons.add_circle_outline,
                                    color: ColorManager.white),
                                onPressed: () {
                                  int count =productEntity.count!.toInt();
                                  count++;
                                  CartScreenViewModel.get(context).updateItemCart(count, productEntity.product!.id??"");

                                },
                              ),
                              Text(
                                "${productEntity.count}",
                                style: getTextStyle(
                                    16, FontWeightManager.medium, Colors.white),
                              ),
                              IconButton(
                                icon: Icon(Icons.remove_circle_outline,
                                    color: ColorManager.white),
                                onPressed: () {
                                  int count =productEntity.count!.toInt();
                                  count--;
                                  CartScreenViewModel.get(context).updateItemCart(count, productEntity.product!.id??"");
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
