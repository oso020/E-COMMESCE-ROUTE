import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/api_manger.dart';
import 'package:ecommerce/data/data_source/home_data_source.dart';
import 'package:ecommerce/data/model/CategoryOrBrandResponseDto.dart';
import 'package:ecommerce/domain/entites/CategoryResponseEntity.dart';
import 'package:ecommerce/domain/faluires.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: HomeDataSource)
class HomeDataSourceImpl implements HomeDataSource{
  ApiManger apiManger;
  HomeDataSourceImpl({
    required this.apiManger
});
  @override
  Future<Either<Failures, CategoryOrBrandResponseDto>> getAllCategory() async{
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult.contains(ConnectivityResult.wifi) ||
          checkResult.contains(ConnectivityResult.mobile) ) {
        // internet


        var response = await apiManger.getData("https://ecommerce.routemisr.com/api/v1/categories");



        var category = CategoryOrBrandResponseDto.fromJson(response.data);

        if(category.statusMsg == 'fail'){
          return Left(ServerError(errorMessage: category.message!));
          /// error
        }
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          /// success
          return Right(category);
        }else{
          return Left(ServerError(errorMessage: category.message!));
        }
      } else {
        /// no internet connection
        return Left(NetworkError(
            errorMessage: 'No Internet Connection, Please'
                'check internet connection'));
      }
    }catch(e){

      return Left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllBrandes() async{
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult.contains(ConnectivityResult.wifi) ||
          checkResult.contains(ConnectivityResult.mobile) ) {
        // internet


        var response = await apiManger.getData("https://ecommerce.routemisr.com/api/v1/brands");



        var brandes = CategoryOrBrandResponseDto.fromJson(response.data);

        if(brandes.statusMsg == 'fail'){
          return Left(ServerError(errorMessage: brandes.message!));
          /// error
        }
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          /// success
          return Right(brandes);
        }else{
          return Left(ServerError(errorMessage: brandes.message!));
        }
      } else {
        /// no internet connection
        return Left(NetworkError(
            errorMessage: 'No Internet Connection, Please'
                'check internet connection'));
      }
    }catch(e){

      return Left(Failures(errorMessage: e.toString()));
    }
  }

}