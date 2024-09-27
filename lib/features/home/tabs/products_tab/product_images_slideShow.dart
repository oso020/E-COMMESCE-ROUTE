import 'package:e_commerce_app/domain/entity_models/ProductResponseEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import '../../../../core/resources/color_manager.dart';

class ProductImagesSlideshow extends StatelessWidget {
  ProductEntity productEntity;

  ProductImagesSlideshow({required this.productEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      width: double.infinity,
      height: double.infinity,
      initialPage: 0,
      indicatorColor: Colors.blue,
      indicatorBackgroundColor: Colors.grey,
      autoPlayInterval: 3000,
      isLoop: true,
      children: productEntity.images!
          .map(
            (url) => ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                url,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                // Ensures the image covers the container
                loadingBuilder: (context, child, progress) {
                  if (progress == null) {
                    return child;
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        color: ColorManager.primary,
                      ),
                    );
                  }
                },
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                    child: Icon(Icons.error, color: Colors.red),
                  );
                },
              ),
            ),
          )
          .toList(),
    );
  }
}
