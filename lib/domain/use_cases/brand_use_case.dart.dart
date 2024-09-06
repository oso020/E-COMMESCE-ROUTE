import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/repo/HomeRepo.dart';
import 'package:injectable/injectable.dart';

import '../entites/CategoryResponseEntity.dart';
import '../faluires.dart';
@injectable
class BrandUseCase{
  HomeRepo homeRepo;
  BrandUseCase({
    required this.homeRepo
});

  Future<Either<Failures,CategoryOrBrandResponseEntity>> getAllBrand()async{
    return homeRepo.getAllBrandes();
  }
}