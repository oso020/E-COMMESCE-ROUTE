import 'package:ecommerce/domain/entites/ProductResponseEntity.dart';
import 'package:ecommerce/domain/faluires.dart';

abstract class ProductStates{

}

class ProductBegin extends ProductStates{}
class ProductLoading extends ProductStates{}
class ProductSuccess extends ProductStates{
  List<ProductDataEntity> product;
  ProductSuccess({required this.product});
}
class ProductError extends ProductStates{
  Failures failures ;

  ProductError({required this.failures});
}
