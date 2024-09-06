
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Feature/product/cubit/product_states.dart';
import 'package:ecommerce/Feature/product/cubit/view_model.dart';
import 'package:ecommerce/Feature/product/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/widgets_and_functions/TextFieldCustom.dart';

class ProductScreen extends StatelessWidget {
  static const String routeScreen="product_screen";
   ProductScreen({super.key});
  TextEditingController search=TextEditingController();

  @override
  Widget build(BuildContext context) {
    var viewModel=ProductViewModel.get(context);
    return Scaffold(
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
                    controller: search,
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

              ],
            ),

            BlocBuilder<ProductViewModel,ProductStates>(
              bloc: viewModel..getProduct(),
              builder: (context, state) {
                if(state is ProductSuccess){
                  return  Expanded(child:
                  GridView.builder(
                    padding:EdgeInsets.zero,
                    itemCount:state.product.length,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){

                        },
                        child: ProductItem(
                          productDataEntity: state.product[index],
                        ),
                      );
                    },
                  )
                  );
                } else if(state is ProductError){
                  return  Text(state.failures.errorMessage);
                }else{
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

              },

            )

          ],
        ),
      ),
    );
  }
}
