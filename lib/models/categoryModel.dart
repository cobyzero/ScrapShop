class CategoryModel {
  int? id;
  String? createdAt;
  String? name;

  CategoryModel({this.id, this.createdAt, this.name});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['name'] = this.name;
    return data;
  }
}
