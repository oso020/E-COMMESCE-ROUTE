import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/api_manger.dart';
import 'package:ecommerce/data/data_source/product_data_source.dart';
import 'package:ecommerce/data/model/ProductResponseDto.dart';
import 'package:ecommerce/domain/faluires.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:ProductDataSource )
class ProductDataSourceImpl implements ProductDataSource{
  ApiManger apiManger;
  ProductDataSourceImpl({required this.apiManger});
  @override
  Future<Either<Failures, ProductResponseDto>> getAllProduct()async {
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult.contains(ConnectivityResult.wifi) ||
          checkResult.contains(ConnectivityResult.mobile) ) {
        // internet


        var response = await apiManger.getData("https://ecommerce.routemisr.com/api/v1/products");



        var product = ProductResponseDto.fromJson(response.data);

        if(product.statusMsg == 'fail'){
          return Left(ServerError(errorMessage: product.message!));
          /// error
        }
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          /// success
          return Right(product);
        }else{
          return Left(ServerError(errorMessage: product.message!));
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