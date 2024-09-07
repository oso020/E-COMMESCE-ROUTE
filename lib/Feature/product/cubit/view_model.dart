import 'package:bloc/bloc.dart';
import 'package:ecommerce/Feature/product/cubit/product_states.dart';
import 'package:ecommerce/domain/entites/ProductResponseEntity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/use_cases/product_use_case.dart';
@injectable
class ProductViewModel extends Cubit<ProductStates>{
  ProductUseCase productUseCase;

  ProductViewModel({required this.productUseCase}):super(ProductBegin());

  static ProductViewModel get(context)=> BlocProvider.of(context);

  List<ProductDataEntity> product=[];
  String?errorMessage;
 Future<void> getProduct()async{

    emit(ProductLoading());
    var response =await productUseCase.invoke();

    response.fold((l) {
      errorMessage=l.errorMessage;
      emit(ProductError(
        failures: l
      ));


    }, (r) {
      product=r.data!;
      emit(ProductSuccess(
        product: r.data!
      ));
    },);
  }


}