class sizeTypeModel {
  int? id;
  String? createdAt;
  String? nameSize;

  sizeTypeModel({this.id, this.createdAt, this.nameSize});

  sizeTypeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    nameSize = json['nameSize'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['nameSize'] = this.nameSize;
    return data;
  }
}
