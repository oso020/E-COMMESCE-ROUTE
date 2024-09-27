/// status : "success"
/// message : "Product added successfully to your cart"
/// numOfCartItems : 1
/// cartId : "66dffcc5bedb1f456c742dd4"
/// data : {"_id":"66dffcc5bedb1f456c742dd4","cartOwner":"66d19a8392a7a3dc57c1cf70","products":[{"count":1,"_id":"66dffcc5bedb1f456c742dd5","product":"6428eb43dc1175abc65ca0b3","price":149}],"createdAt":"2024-09-10T08:01:09.518Z","updatedAt":"2024-09-10T08:01:09.731Z","__v":0,"totalCartPrice":149}

class AddToCartResponseEntity {
  AddToCartResponseEntity({
    this.status,
    this.message,
    this.numOfCartItems,
    this.cartId,
    this.data,
  });

  String? status;
  String? message;
  num? numOfCartItems;
  String? cartId;
  AddDataCartEntity? data;
}

/// _id : "66dffcc5bedb1f456c742dd4"
/// cartOwner : "66d19a8392a7a3dc57c1cf70"
/// products : [{"count":1,"_id":"66dffcc5bedb1f456c742dd5","product":"6428eb43dc1175abc65ca0b3","price":149}]
/// createdAt : "2024-09-10T08:01:09.518Z"
/// updatedAt : "2024-09-10T08:01:09.731Z"
/// __v : 0
/// totalCartPrice : 149

class AddDataCartEntity {
  AddDataCartEntity({
    this.id,
    this.cartOwner,
    this.products,
    this.v,
    this.totalCartPrice,
  });

  String? id;
  String? cartOwner;
  List<AddProductsEntity>? products;

  num? v;
  num? totalCartPrice;
}

/// count : 1
/// _id : "66dffcc5bedb1f456c742dd5"
/// product : "6428eb43dc1175abc65ca0b3"
/// price : 149

class AddProductsEntity {
  AddProductsEntity({
    this.count,
    this.id,
    this.product,
    this.price,
  });

  num? count;
  String? id;
  String? product;
  num? price;
}
