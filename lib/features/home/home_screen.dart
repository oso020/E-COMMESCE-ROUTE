import 'package:e_commerce_app/core/resources/assets_manager.dart';
import 'package:e_commerce_app/core/resources/color_manager.dart';
import 'package:e_commerce_app/core/resources/font_manager.dart';
import 'package:e_commerce_app/core/resources/style_manager.dart';
import 'package:e_commerce_app/core/widgets/custom_button_navigatio_bar.dart';
import 'package:e_commerce_app/features/home/home_cubit/home_screen_cubit.dart';
import 'package:e_commerce_app/features/home/home_cubit/home_screen_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenViewModel viewModel = HomeScreenViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenViewModel, HomeScreenState>(
      bloc: viewModel,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: ColorManager.white,
                leading: Image.asset(
                  ImageAsset.routeLogoBlue,
                  height: kToolbarHeight,
                ),
                leadingWidth: 90,
                floating: true,
                pinned: false,
                snap: true,
              ),
              SliverFillRemaining(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: viewModel.tabs[viewModel.currentIndex],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: _buildBottomNavigationBar(),
        );
      },
    );
  }

  Widget _buildSearchBar() {
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
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.shopping_cart_outlined,
            size: 30,
            color: ColorManager.primary,
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: CustomBottomNavigationBar(
        backgroundColor: ColorManager.primary,
        unselectedIcons: [
          ImageAsset.homeWhite,
          ImageAsset.categoryWhite,
          ImageAsset.heartWhite,
          ImageAsset.userWhite,
        ],
        selectedIcons: [
          ImageAsset.homeBlue,
          ImageAsset.categoryBlue,
          ImageAsset.heartBlue,
          ImageAsset.userBlue,
        ],
        currentIndex: viewModel.currentIndex,
        onItemSelected: (int index) {
          viewModel.changeSelectedIndex(index);
          print(index);
        },
      ),
    );
  }
}
