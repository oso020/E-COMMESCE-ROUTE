import 'package:e_commerce_app/features/home/home_cubit/home_screen_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../tabs/favourites_tab/favourites_tab.dart';
import '../tabs/home_tab/home_tab.dart';
import '../tabs/products_tab/products_tab.dart';
import '../tabs/user_tab/user_tab.dart';

class HomeScreenViewModel extends Cubit<HomeScreenState> {
  HomeScreenViewModel() : super(HomeScreenInitialState());

  int currentIndex = 0;
  final List<Widget> tabs = [
    HomeTab(),
    ProductsTab(),
    FavouritesTabTab(),
    UserTab()
  ];

  void changeSelectedIndex(int selectedIndex) {
    emit(HomeScreenInitialState());
    currentIndex = selectedIndex;
    emit(ChangeSelectedIndexState());
  }
}
