import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/repo/productRepo.dart';
import 'package:injectable/injectable.dart';

import '../entites/ProductResponseEntity.dart';
import '../faluires.dart';
@injectable
class ProductUseCase{
  ProductRepo productRepo;
  ProductUseCase({required this.productRepo});


  Future<Either<Failures,ProductResponseEntity>>  invoke()async{

    return  await productRepo.getAllProduct();
  }
}