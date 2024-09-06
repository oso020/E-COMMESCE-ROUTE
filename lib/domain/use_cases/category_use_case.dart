import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/repo/HomeRepo.dart';
import 'package:injectable/injectable.dart';

import '../entites/CategoryResponseEntity.dart';
import '../faluires.dart';
@injectable
class CategoryUseCase{
  HomeRepo homeRepo;
  CategoryUseCase({
    required this.homeRepo
});

  Future<Either<Failures,CategoryOrBrandResponseEntity>> getAllCategory()async{
    return homeRepo.getAllCategory();
  }
}