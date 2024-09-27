import 'package:e_commerce_app/domain/entity_models/CategoryResponseEntity.dart';
import 'package:e_commerce_app/domain/failures.dart';

abstract class HomeTabState {}

class HomeTabInitialState extends HomeTabState {}

class HomeCategoriesLoadingState extends HomeTabState {}

class HomeCategoriesErrorState extends HomeTabState {
  Failure failure;

  HomeCategoriesErrorState({required this.failure});
}

class HomeCategoriesSuccessState extends HomeTabState {
  CategoryResponseEntity categoryResponseEntity;

  HomeCategoriesSuccessState({required this.categoryResponseEntity});
}

class HomeBrandsLoadingState extends HomeTabState {}

class HomeBrandsErrorState extends HomeTabState {
  Failure failure;

  HomeBrandsErrorState({required this.failure});
}

class HomeBrandsSuccessState extends HomeTabState {
  dynamic responseEntity;

  HomeBrandsSuccessState({required this.responseEntity});
}
