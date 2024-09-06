import 'package:ecommerce/domain/entites/CategoryResponseEntity.dart';
import 'package:ecommerce/domain/faluires.dart';

abstract class HomeStates{}
class HomeBeginState extends HomeStates{}
class  CategoryLoadingState extends HomeStates{}
class CategorySuccessState extends HomeStates{
  List<CategoryOrBrandDataEntity> categoryDataEntity;
  CategorySuccessState({
    required this.categoryDataEntity
});
}
class CategoryErrorState extends HomeStates{
  Failures failures;
  CategoryErrorState({
    required this.failures
});
}



class  BrandLoadingState extends HomeStates{}
class BrandSuccessState extends HomeStates{
  List<CategoryOrBrandDataEntity> brandDataEntity;
  BrandSuccessState({
    required this.brandDataEntity
  });
}
class BrandErrorState extends HomeStates{
  Failures failures;
  BrandErrorState({
    required this.failures
  });
}
