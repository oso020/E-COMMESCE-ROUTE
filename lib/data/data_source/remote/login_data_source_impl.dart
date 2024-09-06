import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/data_source/login_data_soure.dart';
import 'package:ecommerce/data/model/LoginResponseDto.dart';
import 'package:ecommerce/domain/entites/LoginResponseEntity.dart';
import 'package:ecommerce/domain/faluires.dart';
import 'package:injectable/injectable.dart';

import '../../../core/widgets_and_functions/share_prefs.dart';
import '../../api_manger.dart';

@Injectable(as: LoginDataSource)
class LoginDataSourceImpl implements LoginDataSource{
  ApiManger apiManger;
  LoginDataSourceImpl({required this.apiManger});
  @override
  Future<Either<Failures, LoginResponseEntity>> login(String email, String password)async {
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult.contains(ConnectivityResult.wifi) ||
          checkResult.contains(ConnectivityResult.mobile) ) {
        // internet


        var response = await apiManger.postData(
            "https://ecommerce.routemisr.com/api/v1/auth/signin",
            body: {
              "email": email,
              "password": password,
            });

        var loginResponse = LoginResponseDto.fromJson(response.data);

        if(loginResponse.statusMsg == 'fail'){
          return Left(ServerError(errorMessage: loginResponse.message!));
          /// error
        }
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          /// success
          SharedPrefsLocal.saveData(key: "token", value: loginResponse.token);
          return Right(loginResponse);
        }else{
          return Left(ServerError(errorMessage: loginResponse.message!));
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