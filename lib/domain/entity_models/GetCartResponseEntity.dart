import 'package:e_commerce_app/domain/entity_models/BrandResponseEntity.dart';
import 'package:e_commerce_app/domain/entity_models/CategoryResponseEntity.dart';
import 'package:e_commerce_app/domain/entity_models/ProductResponseEntity.dart';

/// status : "success"
/// numOfCartItems : 6
/// cartId : "66dffcc5bedb1f456c742dd4"
/// data : {"_id":"66dffcc5bedb1f456c742dd4","cartOwner":"66d19a8392a7a3dc57c1cf70","products":[{"count":4,"_id":"66dffcc5bedb1f456c742dd5","product":{"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"_id":"6428eb43dc1175abc65ca0b3","title":"Woman Shawl","quantity":220,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680403266739-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.8,"id":"6428eb43dc1175abc65ca0b3"},"price":149},{"count":5,"_id":"66e015c0bedb1f456c74f56a","product":{"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"_id":"6428ebc6dc1175abc65ca0b9","title":"Woman Shawl","quantity":225,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680403397402-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.8,"id":"6428ebc6dc1175abc65ca0b9"},"price":170},{"count":1,"_id":"66e015d1bedb1f456c74f591","product":{"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"_id":"6428e884dc1175abc65ca096","title":"Woman Shawl","quantity":228,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680402563605-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.2,"id":"6428e884dc1175abc65ca096"},"price":349},{"count":1,"_id":"66e015e5bedb1f456c74f5fa","product":{"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"_id":"6428e778dc1175abc65ca08a","title":"Woman Brown Long Sleeve Tunic LT.CAMEL","quantity":229,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680402295928-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.7,"id":"6428e778dc1175abc65ca08a"},"price":499},{"count":4,"_id":"66e01d29bedb1f456c751c04","product":{"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"_id":"6428ead5dc1175abc65ca0ad","title":"Woman Shawl","quantity":220,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680403156501-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.8,"id":"6428ead5dc1175abc65ca0ad"},"price":149},{"count":1,"_id":"66e0289bbedb1f456c755b2f","product":{"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"_id":"6428e479dc1175abc65ca078","title":"Woman Socks","quantity":117,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680401528864-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.3,"id":"6428e479dc1175abc65ca078"},"price":199}],"createdAt":"2024-09-10T08:01:09.518Z","updatedAt":"2024-09-10T11:08:11.983Z","__v":5,"totalCartPrice":3089}

class GetCartResponseEntity {
  GetCartResponseEntity({
    this.status,
    this.numOfCartItems,
    this.cartId,
    this.data,
  });

  String? status;
  num? numOfCartItems;
  String? cartId;
  GetDateEntity? data;
}

/// _id : "66dffcc5bedb1f456c742dd4"
/// cartOwner : "66d19a8392a7a3dc57c1cf70"
/// products : [{"count":4,"_id":"66dffcc5bedb1f456c742dd5","product":{"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"_id":"6428eb43dc1175abc65ca0b3","title":"Woman Shawl","quantity":220,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680403266739-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.8,"id":"6428eb43dc1175abc65ca0b3"},"price":149},{"count":5,"_id":"66e015c0bedb1f456c74f56a","product":{"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"_id":"6428ebc6dc1175abc65ca0b9","title":"Woman Shawl","quantity":225,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680403397402-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.8,"id":"6428ebc6dc1175abc65ca0b9"},"price":170},{"count":1,"_id":"66e015d1bedb1f456c74f591","product":{"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"_id":"6428e884dc1175abc65ca096","title":"Woman Shawl","quantity":228,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680402563605-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.2,"id":"6428e884dc1175abc65ca096"},"price":349},{"count":1,"_id":"66e015e5bedb1f456c74f5fa","product":{"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"_id":"6428e778dc1175abc65ca08a","title":"Woman Brown Long Sleeve Tunic LT.CAMEL","quantity":229,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680402295928-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.7,"id":"6428e778dc1175abc65ca08a"},"price":499},{"count":4,"_id":"66e01d29bedb1f456c751c04","product":{"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"_id":"6428ead5dc1175abc65ca0ad","title":"Woman Shawl","quantity":220,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680403156501-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.8,"id":"6428ead5dc1175abc65ca0ad"},"price":149},{"count":1,"_id":"66e0289bbedb1f456c755b2f","product":{"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"_id":"6428e479dc1175abc65ca078","title":"Woman Socks","quantity":117,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680401528864-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.3,"id":"6428e479dc1175abc65ca078"},"price":199}]
/// createdAt : "2024-09-10T08:01:09.518Z"
/// updatedAt : "2024-09-10T11:08:11.983Z"
/// __v : 5
/// totalCartPrice : 3089

class GetDateEntity {
  GetDateEntity({
    this.id,
    this.cartOwner,
    this.products,
    this.v,
    this.totalCartPrice,
  });

  String? id;
  String? cartOwner;
  List<GetProductsCartEntity>? products;

  num? v;
  num? totalCartPrice;
}

/// count : 4
/// _id : "66dffcc5bedb1f456c742dd5"
/// product : {"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"_id":"6428eb43dc1175abc65ca0b3","title":"Woman Shawl","quantity":220,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680403266739-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.8,"id":"6428eb43dc1175abc65ca0b3"}
/// price : 149

class GetProductsCartEntity {
  GetProductsCartEntity({
    this.count,
    this.id,
    this.product,
    this.price,
  });

  num? count;
  String? id;
  GetProductEntity? product;
  num? price;
}

/// subcategory : [{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}]
/// _id : "6428eb43dc1175abc65ca0b3"
/// title : "Woman Shawl"
/// quantity : 220
/// imageCover : "https://ecommerce.routemisr.com/Route-Academy-products/1680403266739-cover.jpeg"
/// category : {"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"}
/// brand : {"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"}
/// ratingsAverage : 4.8
/// id : "6428eb43dc1175abc65ca0b3"

class GetProductEntity {
  GetProductEntity({
    this.subcategory,
    this.id,
    this.title,
    this.quantity,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
  });

  List<SubcategoryEntity>? subcategory;
  String? id;
  String? title;
  num? quantity;
  String? imageCover;
  CategoryEntity? category;
  BrandEntity? brand;
  num? ratingsAverage;
}

/// _id : "64089bbe24b25627a253158b"
/// name : "DeFacto"
/// slug : "defacto"
/// image : "https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"

// class Brand {
//   Brand({
//       this.id,
//       this.name,
//       this.slug,
//       this.image,});
//
//   Brand.fromJson(dynamic json) {
//     id = json['_id'];
//     name = json['name'];
//     slug = json['slug'];
//     image = json['image'];
//   }
//   String? id;
//   String? name;
//   String? slug;
//   String? image;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['_id'] = id;
//     map['name'] = name;
//     map['slug'] = slug;
//     map['image'] = image;
//     return map;
//   }
//
// }

/// _id : "6439d58a0049ad0b52b9003f"
/// name : "Women's Fashion"
/// slug : "women's-fashion"
/// image : "https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"

// class Category {
//   Category({
//       this.id,
//       this.name,
//       this.slug,
//       this.image,});
//
//   Category.fromJson(dynamic json) {
//     id = json['_id'];
//     name = json['name'];
//     slug = json['slug'];
//     image = json['image'];
//   }
//   String? id;
//   String? name;
//   String? slug;
//   String? image;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['_id'] = id;
//     map['name'] = name;
//     map['slug'] = slug;
//     map['image'] = image;
//     return map;
//   }
//
// }

/// _id : "6407f1bcb575d3b90bf95797"
/// name : "Women's Clothing"
/// slug : "women's-clothing"
/// category : "6439d58a0049ad0b52b9003f"
