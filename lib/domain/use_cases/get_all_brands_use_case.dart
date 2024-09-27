import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entity_models/BrandResponseEntity.dart';
import '../failures.dart';
import '../repositories/home_repository.dart';

@injectable
class GetAllBrandsUseCase {
  HomeRepository homeRepository;

  GetAllBrandsUseCase({required this.homeRepository});

  Future<Either<Failure, BrandResponseEntity>> invoke() {
    return homeRepository.getAllBrands();
  }
}
