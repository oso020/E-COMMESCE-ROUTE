import 'package:e_commerce_app/domain/entity_models/AddToCartResponseEntity.dart';
import 'package:e_commerce_app/domain/use_cases/get_all_products_use_case.dart';
import 'package:e_commerce_app/features/home/tabs/products_tab/cubit/product_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/entity_models/ProductResponseEntity.dart';
import '../../../../../domain/use_cases/add_to_cart_use_case.dart';

@injectable
class ProductsTabViewModel extends Cubit<ProductTabState> {
  GetAllProductsUseCase getAllProductsUseCase;
  AddToCartUseCase addToCartUseCase;

  ProductsTabViewModel(
      {required this.getAllProductsUseCase, required this.addToCartUseCase})
      : super(ProductInitialState());

  static ProductsTabViewModel get(context) => BlocProvider.of(context);
  List<ProductEntity> productsList = [];
  List<AddProductsEntity> cartProductsList = [];
  int numOfCartItems = 0;
  void getAllProducts() async {
    var either = await getAllProductsUseCase.invoke();
    either.fold((error) {
      emit(ProductErrorState(failure: error));
    }, (response) {
      productsList = response.data ?? [];
      emit(ProductSuccessState(productResponseEntity: response));
    });
  }

  void addToCart(String productId) async {
    emit(AddToCartLoadingState());
    var either = await addToCartUseCase.invoke(productId);
    either.fold((error) {
      emit(AddToCartErrorState(failure: error));
    }, (response) {
      numOfCartItems = response.numOfCartItems!.toInt();
      cartProductsList = response.data!.products!;
      emit(AddToCartSuccessState(addToCartResponseEntity: response));
    });
  }
}
