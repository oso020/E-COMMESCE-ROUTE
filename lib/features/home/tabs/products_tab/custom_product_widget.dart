import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/resources/assets_manager.dart';
import 'package:e_commerce_app/core/resources/color_manager.dart';
import 'package:e_commerce_app/core/resources/font_manager.dart';
import 'package:e_commerce_app/core/resources/style_manager.dart';
import 'package:e_commerce_app/features/home/tabs/products_tab/cubit/product_tab_states.dart';
import 'package:e_commerce_app/features/home/tabs/products_tab/cubit/products_tab_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/routes_manager/routes.dart';
import '../../../../domain/entity_models/ProductResponseEntity.dart';

class CustomProductWidget extends StatelessWidget {
  final ProductEntity productEntity;

  CustomProductWidget({required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsTabViewModel, ProductTabState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, Routes.productDetailsScreenRoute,
                arguments: productEntity);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: ColorManager.primary, width: 1.5),
            ),
            child: Column(
              children: [
                Expanded(flex: 1, child: _buildProductImage()),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                productEntity.title ?? "",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: getTextStyle(
                                    12,
                                    FontWeightManager.semiBold,
                                    ColorManager.darkBlue),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text("EGP ${productEntity.price ?? ""}",
                              style: getTextStyle(14, FontWeightManager.medium,
                                  ColorManager.darkBlue)),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Text(
                                "Review (${productEntity.ratingsAverage ?? ""})",
                                style: getTextStyle(
                                    12,
                                    FontWeightManager.medium,
                                    ColorManager.darkBlue),
                              ),
                              Icon(
                                Icons.star,
                                color: ColorManager.yellow,
                                size: 20,
                              ),
                              Spacer(),
                              _buildAddToCartButton(context),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildProductImage() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          ),
          child: CachedNetworkImage(
            imageUrl: productEntity.imageCover ?? "",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
            placeholder: (context, url) => _buildShimmerEffect(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Image.asset(ImageAsset.filledHeart),
        ),
      ],
    );
  }

  Widget _buildShimmerEffect() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[350]!,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
      ),
    );
  }

  Widget _buildAddToCartButton(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(ColorManager.primary),
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        shape: WidgetStateProperty.all(CircleBorder()),
        minimumSize: WidgetStateProperty.all(Size(40, 40)),
      ),
      onPressed: () {
        ProductsTabViewModel.get(context).addToCart(productEntity.id ?? "");
      },
      child: const Icon(
        Icons.add, // Plus icon
        color: Colors.white, // Icon color
        size: 20, // Icon size
      ),
    );
  }
}
