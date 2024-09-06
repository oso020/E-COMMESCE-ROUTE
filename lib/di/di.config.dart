// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../data/api_manger.dart' as _i259;
import '../data/data_source/home_data_source.dart' as _i635;
import '../data/data_source/login_data_soure.dart' as _i317;
import '../data/data_source/product_data_source.dart' as _i972;
import '../data/data_source/register_data_source.dart' as _i272;
import '../data/data_source/remote/home_data_source_impl.dart' as _i384;
import '../data/data_source/remote/login_data_source_impl.dart' as _i592;
import '../data/data_source/remote/product_data_source_Impl.dart' as _i620;
import '../data/data_source/remote/register_data_source_impl.dart' as _i511;
import '../data/rep_impl/home_repo_impl.dart' as _i430;
import '../data/rep_impl/login_repo_impl.dart' as _i1063;
import '../data/rep_impl/product_repo_impl.dart' as _i527;
import '../data/rep_impl/register_repo_impl.dart' as _i831;
import '../domain/repo/HomeRepo.dart' as _i749;
import '../domain/repo/loginRepo.dart' as _i683;
import '../domain/repo/productRepo.dart' as _i102;
import '../domain/repo/registerRepo.dart' as _i15;
import '../domain/use_cases/brand_use_case.dart.dart' as _i409;
import '../domain/use_cases/category_use_case.dart' as _i424;
import '../domain/use_cases/product_use_case.dart' as _i464;
import '../domain/use_cases/use_case_login.dart' as _i850;
import '../domain/use_cases/use_case_register.dart' as _i615;
import '../Feature/auth/login/cubit/login_view_model.dart' as _i532;
import '../Feature/auth/register/cubit/register_view_model.dart' as _i359;
import '../Feature/Home/cubit/home_view_model.dart' as _i61;
import '../Feature/product/cubit/view_model.dart' as _i72;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i259.ApiManger>(() => _i259.ApiManger());
    gh.factory<_i272.RegisterDataSource>(
        () => _i511.RegisterDataSourceImpl(apiManger: gh<_i259.ApiManger>()));
    gh.factory<_i15.RegisterRepo>(() => _i831.RegisterRepoImpl(
        registerDataSource: gh<_i272.RegisterDataSource>()));
    gh.factory<_i615.RegisterUseCase>(
        () => _i615.RegisterUseCase(registerRepo: gh<_i15.RegisterRepo>()));
    gh.factory<_i317.LoginDataSource>(
        () => _i592.LoginDataSourceImpl(apiManger: gh<_i259.ApiManger>()));
    gh.factory<_i635.HomeDataSource>(
        () => _i384.HomeDataSourceImpl(apiManger: gh<_i259.ApiManger>()));
    gh.factory<_i972.ProductDataSource>(
        () => _i620.ProductDataSourceImpl(apiManger: gh<_i259.ApiManger>()));
    gh.factory<_i359.RegisterViewModel>(() =>
        _i359.RegisterViewModel(registerUseCase: gh<_i615.RegisterUseCase>()));
    gh.factory<_i683.LoginRepo>(() =>
        _i1063.LoginRepoImpl(loginDataSource: gh<_i317.LoginDataSource>()));
    gh.factory<_i749.HomeRepo>(
        () => _i430.HomeRepoImpl(homeDataSource: gh<_i635.HomeDataSource>()));
    gh.factory<_i102.ProductRepo>(() => _i527.ProductRepoImpl(
        productDataSource: gh<_i972.ProductDataSource>()));
    gh.factory<_i464.ProductUseCase>(
        () => _i464.ProductUseCase(productRepo: gh<_i102.ProductRepo>()));
    gh.factory<_i72.ProductViewModel>(() =>
        _i72.ProductViewModel(productUseCase: gh<_i464.ProductUseCase>()));
    gh.factory<_i409.BrandUseCase>(
        () => _i409.BrandUseCase(homeRepo: gh<_i749.HomeRepo>()));
    gh.factory<_i424.CategoryUseCase>(
        () => _i424.CategoryUseCase(homeRepo: gh<_i749.HomeRepo>()));
    gh.factory<_i850.LoginUseCase>(
        () => _i850.LoginUseCase(loginRepo: gh<_i683.LoginRepo>()));
    gh.factory<_i532.LoginViewModel>(
        () => _i532.LoginViewModel(loginUseCase: gh<_i850.LoginUseCase>()));
    gh.factory<_i61.HomeViewModel>(() => _i61.HomeViewModel(
          categoryUseCase: gh<_i424.CategoryUseCase>(),
          brandUseCase: gh<_i409.BrandUseCase>(),
        ));
    return this;
  }
}
