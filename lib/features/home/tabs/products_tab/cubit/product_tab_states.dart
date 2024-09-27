import 'package:e_commerce_app/domain/entity_models/ProductResponseEntity.dart';
import 'package:e_commerce_app/domain/failures.dart';

import '../../../../../domain/entity_models/AddToCartResponseEntity.dart';

abstract class ProductTabState {}

class ProductInitialState extends ProductTabState {}

class ProductLoadingState extends ProductTabState {}

class ProductErrorState extends ProductTabState {
  Failure failure;

  ProductErrorState({required this.failure});
}

class ProductSuccessState extends ProductTabState {
  ProductResponseEntity productResponseEntity;

  ProductSuccessState({required this.productResponseEntity});
}

class AddToCartLoadingState extends ProductTabState {
  AddToCartLoadingState();
}

class AddToCartErrorState extends ProductTabState {
  Failure failure;

  AddToCartErrorState({required this.failure});
}

class AddToCartSuccessState extends ProductTabState {
  AddToCartResponseEntity addToCartResponseEntity;

  AddToCartSuccessState({required this.addToCartResponseEntity});
}
