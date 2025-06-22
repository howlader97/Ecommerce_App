class CategoryModel {
  int? id;
  String? name;
  String? slug;
  String? icon;
  String? note;
  String? image;
  String? catCode;
  String? catLevel;
  String? serial;
  int? status;
  String? createdAt;
  String? updatedAt;

  CategoryModel(
      {this.id,
        this.name,
        this.slug,
        this.icon,
        this.note,
        this.image,
        this.catCode,
        this.catLevel,
        this.serial,
        this.status,
        this.createdAt,
        this.updatedAt});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    icon = json['icon'];
    note = json['note'];
    image = json['image'];
    catCode = json['cat_code'];
    catLevel = json['cat_level'];
    serial = json['serial'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['icon'] = icon;
    data['note'] = note;
    data['image'] = image;
    data['cat_code'] = catCode;
    data['cat_level'] = catLevel;
    data['serial'] = serial;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
