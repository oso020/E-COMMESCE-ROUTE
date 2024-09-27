import 'package:e_commerce_app/core/resources/color_manager.dart';
import 'package:e_commerce_app/core/resources/font_manager.dart';
import 'package:e_commerce_app/core/resources/style_manager.dart';
import 'package:e_commerce_app/core/widgets/custom_gridView.dart';
import 'package:e_commerce_app/core/widgets/search_bar_row.dart';
import 'package:e_commerce_app/features/home/tabs/products_tab/cubit/product_tab_states.dart';
import 'package:e_commerce_app/features/home/tabs/products_tab/cubit/products_tab_cubit.dart';
import 'package:e_commerce_app/features/home/tabs/products_tab/custom_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsTab extends StatelessWidget {
  const ProductsTab({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsTabViewModel, ProductTabState>(
      bloc: ProductsTabViewModel.get(context)..getAllProducts(),
      builder: (context, state) {
        if (state is ProductLoadingState) {
          return Center(
              child: CircularProgressIndicator(
            color: ColorManager.primary,
          ));
        } else if (state is ProductErrorState) {
          return Text(
            state.failure.errorMessage,
            style: getTextStyle(
                14, FontWeightManager.medium, ColorManager.primary),
          );
        }
        return Column(
          children: [
            SearchBarRow(),
            Expanded(
              child: CustomGridview(
                scrollDirection: Axis.vertical,
                widgetsList: ProductsTabViewModel.get(context)
                    .productsList
                    .map((productEntity) {
                  return CustomProductWidget(
                    productEntity: productEntity,
                  );
                }).toList(),
                crossAxisCount: 2,
                itemCount:
                    ProductsTabViewModel.get(context).productsList.length,
              ),
            )
          ],
        );
      },
    );
  }
}
