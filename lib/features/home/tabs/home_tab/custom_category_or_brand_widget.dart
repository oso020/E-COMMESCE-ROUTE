// import 'package:e_commerce_app/core/resources/assets_manager.dart';
// import 'package:e_commerce_app/core/resources/color_manager.dart';
// import 'package:e_commerce_app/core/resources/font_manager.dart';
// import 'package:e_commerce_app/core/resources/style_manager.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../../../../domain/entity_models/CategoryResponseEntity.dart';
//
// class CustomCategoryWidget extends StatelessWidget {
//   CategoryEntity category;
//  CustomCategoryWidget({required this.category});
//
//   @override
//   Widget build(BuildContext context) {
//     // List<String> splitName = category.name?.split(' ')??[];
//     return  Column(
//       children: [
//         Container(
//           width: 80,
//           height: 80,
//           clipBehavior: Clip.antiAlias,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(40)
//           ),
//           child: Image.network(category.image??"",
//           width: double.infinity,
//             height: double.infinity,
//             fit: BoxFit.fill,
//           ),
//         ),
//         Container(
//           width: 80,
//           child: Text(category.name??"", softWrap: true, textAlign: TextAlign.center,
//             style:getTextStyle(10, FontWeightManager.medium, ColorManager.darkBlue) ,),
//         )
//       ],
//     );
//   }
// }
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../domain/entity_models/BrandResponseEntity.dart';
import '../../../../domain/entity_models/CategoryResponseEntity.dart';

class CustomCategoryOrBrandWidget extends StatelessWidget {
  dynamic item;

  CustomCategoryOrBrandWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    String name = '';
    String image = '';

    if (item is CategoryEntity) {
      name = (item as CategoryEntity).name ?? '';
      image = (item as CategoryEntity).image ?? '';
    } else if (item is BrandEntity) {
      name = (item as BrandEntity).name ?? '';
      image = (item as BrandEntity).image ?? '';
    }
    return Column(
      children: [
        Container(
            width: 80,
            height: 80,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
            ),
            child: CachedNetworkImage(
              imageUrl: image,
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[350]!,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.white,
                ),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
              fit: BoxFit.fill,
            )
            // Image.network(
            //   image,
            //   width: double.infinity,
            //   height: double.infinity,
            //   fit: BoxFit.fill,
            // ),
            ),
        Container(
          width: 80,
          child: Text(
            name,
            softWrap: true,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeightManager.medium,
              color: ColorManager.darkBlue,
            ),
          ),
        ),
      ],
    );
  }
}
