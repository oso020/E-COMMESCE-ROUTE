import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/data_sources/cart_remote_data_source.dart';
import 'package:e_commerce_app/domain/entity_models/GetCartResponseEntity.dart';
import 'package:e_commerce_app/domain/failures.dart';
import 'package:e_commerce_app/domain/repositories/cart_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  CartRemoteDataSource cartRemoteDataSource;

  CartRepositoryImpl({required this.cartRemoteDataSource});

  @override
  Future<Either<Failure, GetCartResponseEntity>> getCart() async {
    var either = await cartRemoteDataSource.getCart();
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failure, GetCartResponseEntity>> deleteItem(String productId)async {
      var either = await cartRemoteDataSource.deleteItem(productId);
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failure, GetCartResponseEntity>> updateItem(int count,String productId) async{
    var either = await cartRemoteDataSource.updateItem(count, productId);
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
