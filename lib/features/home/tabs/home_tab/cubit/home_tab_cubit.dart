import 'package:e_commerce_app/features/home/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/resources/assets_manager.dart';
import '../../../../../domain/entity_models/BrandResponseEntity.dart';
import '../../../../../domain/entity_models/CategoryResponseEntity.dart';
import '../../../../../domain/use_cases/get_all_brands_use_case.dart';
import '../../../../../domain/use_cases/get_all_categories_use_case.dart';

@injectable
class HomeTabViewModel extends Cubit<HomeTabState> {
  GetAllCategoriesUseCase getAllCategoriesUseCase;
  GetAllBrandsUseCase getAllBrandsUseCase;

  HomeTabViewModel(
      {required this.getAllCategoriesUseCase,
      required this.getAllBrandsUseCase})
      : super(HomeTabInitialState());

  List<CategoryEntity> categoriesList = [];
  List<BrandEntity> brandsList = [];
  List<Image> sliderImages = [
    Image.asset(ImageAsset.announcementImage1),
    Image.asset(ImageAsset.announcementImage1),
    Image.asset(ImageAsset.announcementImage1)
  ];

  //function to create object from viewModel
  static HomeTabViewModel get(context) {
    return BlocProvider.of(context);
  }

  void getAllCategories() async {
    emit(HomeCategoriesLoadingState());
    var either = await getAllCategoriesUseCase.invoke();
    either.fold((error) {
      emit(HomeCategoriesErrorState(failure: error));
    }, (response) {
      categoriesList = response.data ?? [];
      // emit(HomeBrandsSuccessState(responseEntity: response));
      emit(HomeCategoriesSuccessState(categoryResponseEntity: response));
    });
  }

  void getAllBrands() async {
    emit(HomeBrandsLoadingState());
    var either = await getAllBrandsUseCase.invoke();
    either.fold((error) {
      emit(HomeBrandsErrorState(failure: error));
    }, (response) {
      brandsList = response.data ?? [];
      emit(HomeBrandsSuccessState(responseEntity: response));
    });
  }
}
