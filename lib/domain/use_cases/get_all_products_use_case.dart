import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entity_models/ProductResponseEntity.dart';
import '../failures.dart';
import '../repositories/home_repository.dart';

@injectable
class GetAllProductsUseCase {
  HomeRepository homeRepository;

  GetAllProductsUseCase({required this.homeRepository});

  Future<Either<Failure, ProductResponseEntity>> invoke() {
    return homeRepository.getAllProducts();
  }
}
