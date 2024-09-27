import 'package:e_commerce_app/features/home/tabs/products_tab/cart/cubit/cart_screen_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../domain/entity_models/GetCartResponseEntity.dart';
import '../../../../../../domain/use_cases/delete_item_cart_use_case.dart';
import '../../../../../../domain/use_cases/get_cart_use_case.dart';
import '../../../../../../domain/use_cases/update_item_cart_use_case.dart';

@injectable
class CartScreenViewModel extends Cubit<CartScreenState> {
  GetCartUseCase getCartUseCase;
  DeleteItemCartUseCase deleteItemCartUseCase;
  UpdateItemCartUseCase updateItemCartUseCase;

  CartScreenViewModel({required this.getCartUseCase,required this.deleteItemCartUseCase,required this.updateItemCartUseCase})
      : super(InitialCartScreenState());

  List<GetProductsCartEntity> cartProducts = [];

int numOfCart=0;

  static CartScreenViewModel get(context) => BlocProvider.of(context);
  void getCart() async {
    emit(LoadingCartScreenState());
    var either = await getCartUseCase.invoke();
    either.fold((error) {
      emit(ErrorCartScreenState(failure: error));
    }, (response) {

      cartProducts = response.data!.products ?? [];
      emit(SuccessCartScreenState(getCartResponseEntity: response));
    });
  }
  void deleteItemCart(String productId) async {
    print(productId);
    emit(LoadingCartScreenState());
    var either = await deleteItemCartUseCase.invoke(productId);
    either.fold((error) {
      emit(ErrorCartScreenState(failure: error));
    }, (response) {
      cartProducts = response.data!.products ?? [];
      numOfCart=response.numOfCartItems!.toInt();
      emit(SuccessCartScreenState(getCartResponseEntity: response));
    });
  }

  void updateItemCart(int count,String productId) async {
    print(productId);
    emit(LoadingCartScreenState());
    var either = await updateItemCartUseCase.invoke(count,productId);
    either.fold((error) {
      emit(ErrorCartScreenState(failure: error));
    }, (response) {
      cartProducts = response.data!.products ?? [];
      numOfCart=response.numOfCartItems!.toInt();
      emit(SuccessCartScreenState(getCartResponseEntity: response));
    });
  }


}
