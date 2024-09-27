import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entity_models/CategoryResponseEntity.dart';
import '../failures.dart';
import '../repositories/home_repository.dart';

@injectable
class GetAllCategoriesUseCase {
  HomeRepository homeRepository;

  GetAllCategoriesUseCase({required this.homeRepository});

  Future<Either<Failure, CategoryResponseEntity>> invoke() {
    return homeRepository.getAllCategories();
  }
}
