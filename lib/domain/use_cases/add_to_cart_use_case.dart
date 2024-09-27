import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

import '../entity_models/AddToCartResponseEntity.dart';
import '../failures.dart';

@injectable
class AddToCartUseCase {
  HomeRepository homeRepository;

  AddToCartUseCase({required this.homeRepository});

  Future<Either<Failure, AddToCartResponseEntity>> invoke(String productId) {
    return homeRepository.addToCart(productId);
  }
}
