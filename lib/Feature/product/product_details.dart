import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/domain/entites/ProductResponseEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:readmore/readmore.dart';

class ProductDetails extends StatelessWidget {
  static const String routeName = "product_detailes";
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var args=ModalRoute.of(context)?.settings.arguments as ProductDataEntity;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Product Details",
          style: TextStyle(
              fontSize: 20,
              color: Color(0xff06004F),
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: [
          Icon(
            Icons.search,
            color: Color(
              0xff06004F,
            ),
            size: 30,
          ),
          Icon(
            Icons.shopping_cart_outlined,
            color: Color(
              0xff06004F,
            ),
            size: 30,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                ImageSlideshow(
                  width: double.infinity,
                  height: 300,
                  initialPage: 0,
                  indicatorColor: Colors.blue,
                  indicatorBackgroundColor: Colors.grey,
                  onPageChanged: (value) {},
                  autoPlayInterval: 3000,
                  isLoop: true,
                  children:args.images!.map((e) =>ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: CachedNetworkImage(
                        fit: BoxFit.fill,
                        height: 300,
                        width: double.infinity,
                        imageUrl:
                        e,
                        placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                      )), ).toList()
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(
                    Icons.favorite,
                    color: Color(0xff004182),
                    size: 30,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(args.title!),
                Text("EGP ${args.price}"),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: Color(0xff06004F).withOpacity(0.3),
                        )),
                    child: Text("${args.sold} Sold")),
                SizedBox(
                  width: 30,
                ),
                Icon(
                  Icons.star,
                  color: Color(0xffF4B400),
                ),
                SizedBox(
                  width: 5,
                ),
                Text("${args.ratingsAverage} (${args.ratingsQuantity})"),
                Spacer(),
                Container(
                  padding: EdgeInsets.all(8),
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color(0xff004182)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.remove_circle_outline,
                        color: Colors.white,
                      ),
                      Text(
                        "1",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Icon(
                        Icons.add_circle_outline,
                        color: Colors.white,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Text(
              "Description",
              style: TextStyle(fontSize: 22),
            ),
            ReadMoreText(
              args.description!,
              trimMode: TrimMode.Line,
              trimLines: 2,
              colorClickableText: Colors.pink,
              trimCollapsedText: 'Show more',
              trimExpandedText: 'Show less',
              moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text("Total price"),
                    Text("EGP ${args.price}"),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color(0xff004182)),
                  child: Row(
                    children: [
                      Icon(
                        Icons.add_shopping_cart,
                        color: Colors.white,
                      ),
                      Text(
                        "Add to cart",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
