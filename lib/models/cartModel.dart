class CartModel {
  int? id;
  String? createdAt;
  int? productId;
  String? size;
  double? price;
  int? userId;
  CartModel({this.id, this.createdAt, this.productId, this.size, this.price, this.userId});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    productId = json['productId'];
    size = json['size'];
    price = json['price'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['productId'] = this.productId;
    data['size'] = this.size;
    data['price'] = this.price;
    data['userId'] = this.userId;
    return data;
  }
}
