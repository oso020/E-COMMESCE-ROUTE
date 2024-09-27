import 'package:e_commerce_app/domain/entity_models/GetCartResponseEntity.dart';
import 'package:e_commerce_app/domain/failures.dart';

abstract class CartScreenState {}

class InitialCartScreenState extends CartScreenState {}

class LoadingCartScreenState extends CartScreenState {}

class ErrorCartScreenState extends CartScreenState {
  Failure failure;

  ErrorCartScreenState({required this.failure});
}

class SuccessCartScreenState extends CartScreenState {
  GetCartResponseEntity getCartResponseEntity;

  SuccessCartScreenState({required this.getCartResponseEntity});



}


class LoadingDeleteItemCartScreenState extends CartScreenState {}

class ErrorDeleteItemCartScreenState extends CartScreenState {
  Failure failure;

  ErrorDeleteItemCartScreenState({required this.failure});
}

class SuccessDeleteItemCartScreenState extends CartScreenState {
  GetCartResponseEntity getCartResponseEntity;

  SuccessDeleteItemCartScreenState({required this.getCartResponseEntity});}
