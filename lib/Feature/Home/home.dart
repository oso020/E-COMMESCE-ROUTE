import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Feature/Home/cubit/home_states.dart';
import 'package:ecommerce/Feature/Home/cubit/home_view_model.dart';
import 'package:ecommerce/Feature/auth/login/login_screen.dart';
import 'package:ecommerce/Feature/product/product_details.dart';
import 'package:ecommerce/Feature/product/product_screen.dart';
import 'package:ecommerce/core/widgets_and_functions/share_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../core/widgets_and_functions/TextFieldCustom.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "home_screen";
 const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel=HomeViewModel.get(context);
    return BlocBuilder<HomeViewModel, HomeStates>(
      bloc: HomeViewModel.get(context)..getFetch(),
      builder: (context, state) {
        return  Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/images/logo2.png"),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 350,
                      child: Textfieldcustom(
                        controller: HomeViewModel.get(context).search,
                        prefiexIcon: const Icon(
                          Icons.search,
                          color: Color(0xff004182),
                        ),
                        lableText: "search",
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return "Enter your email";
                          }
                          return null;
                        },
                      ),
                    ),
                    InkWell(
                      onTap: () async{
                        await SharedPrefsLocal.prefs.remove("token");

                        Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                      },
                      child: const Icon(
                        Icons.shopping_cart_outlined,
                        color: Color(0xff004182),
                        size: 30,
                      ),
                    )
                  ],
                ),
                ImageSlideshow(
                  width: double.infinity,
                  height: 200,
                  initialPage: 0,
                  indicatorColor: Colors.blue,
                  indicatorBackgroundColor: Colors.grey,
                  onPageChanged: (value) {},
                  autoPlayInterval: 3000,
                  isLoop: true,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        'assets/images/Vector.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        'assets/images/Vector.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        'assets/images/Vector.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Categories",
                      style: TextStyle(color: Color(0xff004182), fontSize: 20),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, ProductScreen.routeScreen);
                      },
                      child: Text(
                        "view all",
                        style: TextStyle(
                          color: Color(0xff004182),
                        ),
                      ),
                    ),
                  ],
                ),
              if (viewModel.category.isNotEmpty )
                    SizedBox(
                        height: 200,
                        child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: viewModel.category.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10),
                          itemBuilder: (context, index) {
                            return ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: CachedNetworkImage(
                                  height: 100,
                                  width: 100,
                                  imageUrl:
                                  viewModel.category[index].image!,
                                  placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ));
                          },
                        ),
                      )
              else if (viewModel.errorCategory !=null)
                Text(viewModel.errorCategory!)
                else
                const Center(
                  child: CircularProgressIndicator(),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Brands",
                  style: TextStyle(
                    color: Color(0xff004182),
                    fontSize: 20,
                  ),
                ),
                if (viewModel.brand.isNotEmpty )
                  SizedBox(
                    height: 200,
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: viewModel.brand.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        return ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: CachedNetworkImage(
                              height: 100,
                              width: 100,
                              imageUrl: viewModel.brand[index].image!,
                              placeholder: (context, url) =>
                                  const Center(child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ));
                      },
                    ),
                  )
                else if (viewModel.errorBrand!=null)
                  Text(viewModel.errorBrand!)
                else
                  const Center(
                    child: CircularProgressIndicator(),
                  )
              ],
            ),
          ),
        );
      },
    );
  }
}
