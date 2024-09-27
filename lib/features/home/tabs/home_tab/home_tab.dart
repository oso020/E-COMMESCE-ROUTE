import 'package:e_commerce_app/core/resources/color_manager.dart';
import 'package:e_commerce_app/core/resources/font_manager.dart';
import 'package:e_commerce_app/core/resources/style_manager.dart';
import 'package:e_commerce_app/core/widgets/DialogUtils.dart';
import 'package:e_commerce_app/core/widgets/custom_gridView.dart';
import 'package:e_commerce_app/core/widgets/search_bar_row.dart';
import 'package:e_commerce_app/features/home/tabs/home_tab/announcement_image_slideShow.dart';
import 'package:e_commerce_app/features/home/tabs/home_tab/cubit/home_tab_cubit.dart';
import 'package:e_commerce_app/features/home/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:e_commerce_app/features/home/tabs/home_tab/custom_category_or_brand_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeTabViewModel, HomeTabState>(
      listener: (context, state) {
        if (state is HomeBrandsErrorState) {
          return DialogUtils.showMessage(
              context: context, message: state.failure.errorMessage);
        }
      },
      bloc: HomeTabViewModel.get(context)
        ..getAllCategories()
        ..getAllBrands(),
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              SearchBarRow(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child:
                    Container(height: 200, child: AnnouncementImageSlideshow()),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categories",
                    style: getTextStyle(
                        18, FontWeightManager.bold, ColorManager.darkBlue),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "View all",
                        style: getTextStyle(12, FontWeightManager.regular,
                            ColorManager.darkBlue),
                      ))
                ],
              ),
              state is HomeCategoriesLoadingState
                  ?
                  // or viewModel.CategoriesList.isEmpty?
                  Center(
                      child: CircularProgressIndicator(
                          color: ColorManager.primary))
                  : SizedBox(
                      height: 270,
                      child: CustomGridview(
                          scrollDirection: Axis.horizontal,
                          widgetsList: HomeTabViewModel.get(context)
                              .categoriesList
                              .map((categoryEntity) =>
                                  CustomCategoryOrBrandWidget(
                                    item: categoryEntity,
                                  ))
                              .toList(),
                          crossAxisCount: 2,
                          itemCount: HomeTabViewModel.get(context)
                                  .categoriesList
                                  .length ??
                              0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Brands",
                    style: getTextStyle(
                        18, FontWeightManager.bold, ColorManager.darkBlue),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "View all",
                        style: getTextStyle(12, FontWeightManager.regular,
                            ColorManager.darkBlue),
                      ))
                ],
              ),
              state is HomeBrandsLoadingState
                  ?
                  // or viewModel.BrandsList.isEmpty?
                  Center(
                      child: CircularProgressIndicator(
                      color: ColorManager.primary,
                    ))
                  : SizedBox(
                      height: 270,
                      child: CustomGridview(
                          scrollDirection: Axis.horizontal,
                          widgetsList: HomeTabViewModel.get(context)
                              .brandsList
                              .map((brandEntity) => CustomCategoryOrBrandWidget(
                                    item: brandEntity,
                                  ))
                              .toList(),
                          crossAxisCount: 2,
                          itemCount:
                              HomeTabViewModel.get(context).brandsList.length ??
                                  0),
                    ),
            ],
          ),
        );
      },
    );
  }
}
