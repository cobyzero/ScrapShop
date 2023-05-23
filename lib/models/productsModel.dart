class ProductsModel {
  int? id;
  String? createdAt;
  int? categoryId;
  String? image;
  String? title;
  String? description;
  int? sizeId;
  double? price;
  bool? active;

  ProductsModel(
      {this.id,
      this.createdAt,
      this.categoryId,
      this.image,
      this.title,
      this.description,
      this.sizeId,
      this.price,
      this.active});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    categoryId = json['categoryId'];
    image = json['image'];
    title = json['title'];
    description = json['description'];
    sizeId = json['sizeId'];
    price = json['price'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['categoryId'] = this.categoryId;
    data['image'] = this.image;
    data['title'] = this.title;
    data['description'] = this.description;
    data['sizeId'] = this.sizeId;
    data['price'] = this.price;
    data['active'] = this.active;
    return data;
  }
}
