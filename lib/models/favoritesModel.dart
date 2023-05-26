class FavoritesModel {
  int? id;
  String? createdAt;
  int? productId;
  int? userId;

  FavoritesModel({this.id, this.createdAt, this.productId, this.userId});

  FavoritesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    productId = json['productId'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['productId'] = this.productId;
    data['userId'] = this.userId;
    return data;
  }
}
