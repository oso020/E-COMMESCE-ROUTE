
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/domain/entites/ProductResponseEntity.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  ProductDataEntity productDataEntity;
   ProductItem({super.key,required this.productDataEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Color(0xff004182).withOpacity(0.3),
          width: 2
        )
      ),
height: 400,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
      ClipRRect(
      borderRadius: BorderRadius.circular(50),
        child: CachedNetworkImage(
          height: 80,
          width: double.infinity,
          imageUrl:
          productDataEntity.images!.first,
          placeholder: (context, url) => const Center(
              child: CircularProgressIndicator()),
          errorWidget: (context, url, error) =>
          const Icon(Icons.error),
        )),
              Text(productDataEntity.title!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(productDataEntity.description!,
              style: TextStyle(fontSize: 10),
              maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

              Text("EGP ${productDataEntity.price.toString()}"),
              Row(
                children: [
                  Text("Review (${productDataEntity.ratingsAverage}) "),
                  Icon(Icons.star,color: Color(0xffFDD835),)
                ],
              ),

            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Icon(
                  Icons.favorite,
                  color: Color(0xff004182),
                  size: 20,
                ),
              ),
              Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Color(0xff004182),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 20,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
