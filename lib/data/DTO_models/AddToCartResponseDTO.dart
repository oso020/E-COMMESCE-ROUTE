import 'package:e_commerce_app/domain/entity_models/AddToCartResponseEntity.dart';

/// status : "success"
/// message : "Product added successfully to your cart"
/// numOfCartItems : 1
/// cartId : "66dffcc5bedb1f456c742dd4"
/// data : {"_id":"66dffcc5bedb1f456c742dd4","cartOwner":"66d19a8392a7a3dc57c1cf70","products":[{"count":1,"_id":"66dffcc5bedb1f456c742dd5","product":"6428eb43dc1175abc65ca0b3","price":149}],"createdAt":"2024-09-10T08:01:09.518Z","updatedAt":"2024-09-10T08:01:09.731Z","__v":0,"totalCartPrice":149}

class AddToCartResponseDTO extends AddToCartResponseEntity {
  AddToCartResponseDTO(
      {super.status,
      super.message,
      super.numOfCartItems,
      super.cartId,
      super.data,
      this.statusMsg});

  AddToCartResponseDTO.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    statusMsg = json['statusMsg'];

    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? AddDataCartDTO.fromJson(json['data']) : null;
  }

  String? statusMsg;
}

/// _id : "66dffcc5bedb1f456c742dd4"
/// cartOwner : "66d19a8392a7a3dc57c1cf70"
/// products : [{"count":1,"_id":"66dffcc5bedb1f456c742dd5","product":"6428eb43dc1175abc65ca0b3","price":149}]
/// createdAt : "2024-09-10T08:01:09.518Z"
/// updatedAt : "2024-09-10T08:01:09.731Z"
/// __v : 0
/// totalCartPrice : 149

class AddDataCartDTO extends AddDataCartEntity {
  AddDataCartDTO({
    super.id,
    super.cartOwner,
    super.products,
    this.createdAt,
    this.updatedAt,
    super.v,
    super.totalCartPrice,
  });

  AddDataCartDTO.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(AddProductsDTO.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }

  String? createdAt;
  String? updatedAt;
}

/// count : 1
/// _id : "66dffcc5bedb1f456c742dd5"
/// product : "6428eb43dc1175abc65ca0b3"
/// price : 149

class AddProductsDTO extends AddProductsEntity {
  AddProductsDTO({
    super.count,
    super.id,
    super.product,
    super.price,
  });

  AddProductsDTO.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'];
    price = json['price'];
  }
}
