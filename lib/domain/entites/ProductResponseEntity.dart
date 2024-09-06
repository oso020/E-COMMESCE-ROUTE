import 'package:ecommerce/domain/entites/CategoryResponseEntity.dart';

class ProductResponseEntity {
  ProductResponseEntity({
      this.results, 
      this.data,
  this.statusMsg,
    this.message
  });

  num? results;
  List<ProductDataEntity>? data;
  String?statusMsg;
  String?message;


}

class ProductDataEntity {
  ProductDataEntity({
      this.sold, 
      this.images, 
      this.subcategory, 
      this.ratingsQuantity, 
      this.id, 
      this.title, 
      this.slug, 
      this.description, 
      this.quantity, 
      this.price, 
      this.imageCover, 
      this.category, 
      this.brand, 
      this.ratingsAverage, 
      this.createdAt, 
      this.updatedAt, 
      });

  num? sold;
  List<String>? images;
  List<Subcategory>? subcategory;
  num? ratingsQuantity;
  String? title;
  String? slug;
  String? description;
  num? quantity;
  num? price;
  String? imageCover;
  CategoryOrBrandDataEntity? category;
  CategoryOrBrandDataEntity? brand;
  num? ratingsAverage;
  String? createdAt;
  String? updatedAt;
  String? id;


}



class Subcategory {
  Subcategory({
      this.id, 
      this.name, 
      this.slug, 
      this.category,});

  String? id;
  String? name;
  String? slug;
  String? category;


}

