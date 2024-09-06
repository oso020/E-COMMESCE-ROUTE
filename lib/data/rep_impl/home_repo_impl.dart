import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/data_source/home_data_source.dart';
import 'package:ecommerce/domain/entites/CategoryResponseEntity.dart';
import 'package:ecommerce/domain/faluires.dart';
import 'package:ecommerce/domain/repo/HomeRepo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: HomeRepo)

class HomeRepoImpl implements HomeRepo{
  HomeDataSource homeDataSource;
  HomeRepoImpl({
    required this.homeDataSource
});
  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllCategory()async {
    var response =await homeDataSource.getAllCategory();

    return response.fold((l) => Left(l), (r) => Right(r),);
  }

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllBrandes() async{
    // TODO: implement getAllBrandes
    var response =await homeDataSource.getAllBrandes();

    return response.fold((l) => Left(l), (r) => Right(r),);
  }

}