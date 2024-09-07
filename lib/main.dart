import 'package:ecommerce/Feature/Home/cubit/home_view_model.dart';
import 'package:ecommerce/Feature/Home/home.dart';
import 'package:ecommerce/Feature/product/cubit/view_model.dart';
import 'package:ecommerce/Feature/product/product_screen.dart';
import 'package:ecommerce/di/di.config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Feature/auth/login/login_screen.dart';
import 'Feature/auth/register/register_screen.dart';
import 'Feature/product/product_details.dart';
import 'core/widgets_and_functions/share_prefs.dart';
import 'di/di.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
 await  SharedPrefsLocal.init();
  var token= SharedPrefsLocal.getData(key: "token");
  print(token);
  String route;
  if(token==null){
    route=LoginScreen.routeName;
  }else{
    route=HomeScreen.routeName;
  }


  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => getIt<HomeViewModel>(),),
      BlocProvider(create: (context) => getIt<ProductViewModel>(),)
    ],
      child:  MyApp(
        route: route,
      )),);

}

class MyApp extends StatelessWidget {
  String route;
   MyApp({super.key,required this.route});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: route,
      routes: {
        RegisterScreen.routeName:(context)=>RegisterScreen(),
        LoginScreen.routeName:(context)=>LoginScreen(),
        HomeScreen.routeName:(context)=>HomeScreen(),
        ProductScreen.routeScreen:(context)=>ProductScreen(),
        ProductDetails.routeName:(context)=>ProductDetails(),
      },


    );
  }
}



