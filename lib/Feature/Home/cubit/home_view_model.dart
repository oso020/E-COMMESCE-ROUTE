import 'package:bloc/bloc.dart';
import 'package:ecommerce/Feature/Home/cubit/home_states.dart';
import 'package:ecommerce/domain/use_cases/brand_use_case.dart.dart';
import 'package:ecommerce/domain/use_cases/category_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entites/CategoryResponseEntity.dart';

@injectable
class HomeViewModel extends Cubit<HomeStates> {
  CategoryUseCase categoryUseCase;
  BrandUseCase brandUseCase;
  HomeViewModel({
    required this.categoryUseCase,
  required this.brandUseCase
  }) : super(HomeBeginState());

  static HomeViewModel get(context) => BlocProvider.of(context);
  TextEditingController search = TextEditingController();
  List<CategoryOrBrandDataEntity> category = [];
  List<CategoryOrBrandDataEntity> brand = [];
  bool isLoaded=false;
  String?errorCategory;
  String?errorBrand;

  Future<void>  getCategory() async {
    emit(CategoryLoadingState());
    var response = await categoryUseCase.getAllCategory();
    return response.fold(
      (l) {
        errorCategory=l.errorMessage;
        emit(CategoryErrorState(failures: l));
      },
      (r) {
        category = r.data!;

        emit(CategorySuccessState(categoryDataEntity: r.data!));

      },
    );
  }

  Future<void> getBrand() async {
    emit(BrandLoadingState());
    var response = await brandUseCase.getAllBrand();
    return response.fold(
      (l) {
        errorBrand=l.errorMessage;

        emit(BrandErrorState(failures: l));
      },
      (r) {
        brand = r.data!;

          emit(BrandSuccessState(brandDataEntity: r.data!));

      },
    );
  }

  Future<void>getFetch()async{
    await getCategory();
    await getBrand();



  }


}
