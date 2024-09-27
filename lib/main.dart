import 'package:e_commerce_app/core/routes_manager/route_generator.dart';
import 'package:e_commerce_app/features/home/tabs/home_tab/cubit/home_tab_cubit.dart';
import 'package:e_commerce_app/features/home/tabs/products_tab/cart/cubit/cart_screen_cubit.dart';
import 'package:e_commerce_app/features/home/tabs/products_tab/cubit/products_tab_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/routes_manager/routes.dart';
import 'di/di.dart';
import 'features/shared_preferences_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await SharedPreferencesUtils.init();
  var token = SharedPreferencesUtils.getData("token");
  String route;
  if (token == null) {
    route = Routes.signInScreenRoute;
  } else {
    route = Routes.homeScreenRoute;
    print(token);
  }
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => getIt<HomeTabViewModel>()),
        BlocProvider(create: (context) => getIt<ProductsTabViewModel>()),
        BlocProvider(create: (context) => getIt<CartScreenViewModel>())
      ],
      child: MyApp(
        route: route,
      )));
}

class MyApp extends StatelessWidget {
  String route;

  MyApp({super.key, required this.route});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: route,

      // home: const Home(),
    );
  }
}
