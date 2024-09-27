import 'package:e_commerce_app/core/resources/color_manager.dart';
import 'package:e_commerce_app/core/resources/font_manager.dart';
import 'package:e_commerce_app/core/resources/style_manager.dart';
import 'package:e_commerce_app/domain/entity_models/ProductResponseEntity.dart';
import 'package:e_commerce_app/features/home/tabs/products_tab/product_images_slideShow.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductEntity productEntity;

  const ProductDetailsScreen({required this.productEntity, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String productDescriptionText = productEntity.description ?? "";

    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        // TODO : add leading icon, actions, handle design of search
        backgroundColor: ColorManager.white,
        title: Text(
          "Product Details",
          style: getTextStyle(
            20,
            FontWeightManager.medium,
            ColorManager.darkBlue,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //product images slide show
              Container(
                width: double.infinity,
                height: 300, // Adjust height as needed
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                      color: ColorManager.primary,
                      width: 1.5), // ColorManager.primary should be defined
                ),
                child: ProductImagesSlideshow(productEntity: productEntity),
              ),

              //product title and price
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        maxLines: 2,
                        productEntity.title ?? "",
                        style: getTextStyle(
                          16,
                          FontWeightManager.medium,
                          ColorManager.primary,
                        ),
                      ),
                    ),
                    Text(
                      "EGP ${formatNumber(productEntity.price ?? 0)}",
                      style: getTextStyle(
                        16,
                        FontWeightManager.medium,
                        ColorManager.primary,
                      ),
                    )
                  ],
                ),
              ),

              //product sold amount, rating and increase or decrease quantity button
              Row(
                children: [
                  //sold amount
                  Container(
                    width: 102,
                    height: 34,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: ColorManager.primary, width: 1.5),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                        child: Text(
                      "${formatNumber(productEntity.sold ?? 0) ?? ""} Sold",
                      style: getTextStyle(
                        16,
                        FontWeightManager.medium,
                        ColorManager.primary,
                      ),
                    )),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  //rating
                  Row(children: [
                    Icon(
                      Icons.star,
                      color: ColorManager.yellow,
                      size: 25,
                    ),
                    Text(
                      productEntity.ratingsAverage.toString() ?? "",
                      style: getTextStyle(
                          16, FontWeightManager.medium, ColorManager.primary),
                    ),
                    Text(
                      " (${productEntity.ratingsQuantity ?? ""})",
                      style: getTextStyle(
                          16, FontWeightManager.medium, ColorManager.primary),
                    ),
                  ]),
                  Spacer(),
                  //increase or decrease quantity button
                  _buildIncreaseOrDecreaseButton()
                ],
              ),

              //description
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Description",
                    style: getTextStyle(
                      18,
                      FontWeightManager.medium,
                      ColorManager.primary,
                    )),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: _buildReadMoreText(productDescriptionText)),
              SizedBox(
                height: 100,
              ),
              //total price and add to cart button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
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
                          "EGP ${formatNumber(productEntity.price ?? 0)}",
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
                      child: _buildAddToCartContainer(),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIncreaseOrDecreaseButton() {
    return Container(
      width: 122,
      height: 42,
      decoration: BoxDecoration(
          color: ColorManager.primary, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(Icons.add_circle_outline, color: ColorManager.white),
            onPressed: () {},
          ),
          Text(
            "1",
            style: getTextStyle(16, FontWeightManager.medium, Colors.white),
          ),
          IconButton(
            icon: Icon(Icons.remove_circle_outline, color: ColorManager.white),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildReadMoreText(String descriptionText) {
    return ReadMoreText(
      descriptionText,
      trimLines: 3,
      colorClickableText: ColorManager.primary,
      trimMode: TrimMode.Line,
      trimCollapsedText: 'Read More',
      trimExpandedText: ' Read Less',
      style: TextStyle(fontSize: 14, color: ColorManager.darkGrey),
      moreStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: ColorManager
              .appBarTitleColor), // Style for the clickable "Read More" / "Read Less"
    );
  }

  Widget _buildAddToCartContainer() {
    return Container(
      width: 230,
      height: 48,
      decoration: BoxDecoration(
          color: ColorManager.primary, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.add_shopping_cart_outlined,
            color: ColorManager.white,
          ),
          Text(
            "Add to cart",
            style: getTextStyle(
              18,
              FontWeightManager.bold,
              ColorManager.white,
            ),
          )
        ],
      ),
    );
  }

  static String formatNumber(num number) {
    final formatter = NumberFormat.decimalPattern();
    return formatter.format(number);
  }
}
