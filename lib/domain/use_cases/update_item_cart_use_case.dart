import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/repositories/cart_repository.dart';
import 'package:injectable/injectable.dart';

import '../entity_models/GetCartResponseEntity.dart';
import '../failures.dart';

@injectable
class UpdateItemCartUseCase {
  CartRepository cartRepository;

  UpdateItemCartUseCase({required this.cartRepository});

  Future<Either<Failure, GetCartResponseEntity>> invoke(int count,String productId) {
    return cartRepository.updateItem(count,productId);
  }
}
