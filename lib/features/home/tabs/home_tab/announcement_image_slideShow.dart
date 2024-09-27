import 'package:e_commerce_app/features/home/tabs/home_tab/cubit/home_tab_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class AnnouncementImageSlideshow extends StatelessWidget {
  AnnouncementImageSlideshow({super.key});

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
      children: HomeTabViewModel.get(context).sliderImages,
    );
  }
}
