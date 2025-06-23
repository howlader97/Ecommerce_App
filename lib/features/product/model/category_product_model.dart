class CategoryProductModel {
  int? id;
  String? categoryId;
  String? subCategoryId;
  String? chSubCategoryId;
  int? brandId;
  int? unitId;
  String? name;
  String? slug;
  String? code;
  String? model;
  Null? origin;
  Null? weight;
  Null? serialImei;
  String? shortDescription;
  String? longDescription;
  String? mainImage;
  String? bigImage;
  Null? upComImage;
  Null? videoUrl;
  int? discount;
  int? sellPrice;
  int? regularPrice;
  int? sellQty;
  int? sellCount;
  int? status;
  Null? deletedAt;
  String? createdAt;
  String? updatedAt;
  Category? category;

  CategoryProductModel(
      {this.id,
        this.categoryId,
        this.subCategoryId,
        this.chSubCategoryId,
        this.brandId,
        this.unitId,
        this.name,
        this.slug,
        this.code,
        this.model,
        this.origin,
        this.weight,
        this.serialImei,
        this.shortDescription,
        this.longDescription,
        this.mainImage,
        this.bigImage,
        this.upComImage,
        this.videoUrl,
        this.discount,
        this.sellPrice,
        this.regularPrice,
        this.sellQty,
        this.sellCount,
        this.status,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
        this.category});

  CategoryProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    subCategoryId = json['sub_category_id'];
    chSubCategoryId = json['ch_sub_category_id'];
    brandId = json['brand_id'];
    unitId = json['unit_id'];
    name = json['name'];
    slug = json['slug'];
    code = json['code'];
    model = json['model'];
    origin = json['origin'];
    weight = json['weight'];
    serialImei = json['serial_imei'];
    shortDescription = json['short_description'];
    longDescription = json['long_description'];
    mainImage = json['main_image'];
    bigImage = json['big_image'];
    upComImage = json['up_com_image'];
    videoUrl = json['video_url'];
    discount = json['discount'];
    sellPrice = json['sell_price'];
    regularPrice = json['regular_price'];
    sellQty = json['sell_qty'];
    sellCount = json['sell_count'];
    status = json['status'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category_id'] = categoryId;
    data['sub_category_id'] = subCategoryId;
    data['ch_sub_category_id'] = chSubCategoryId;
    data['brand_id'] = brandId;
    data['unit_id'] = unitId;
    data['name'] = name;
    data['slug'] = slug;
    data['code'] = code;
    data['model'] = model;
    data['origin'] = origin;
    data['weight'] = weight;
    data['serial_imei'] = serialImei;
    data['short_description'] = shortDescription;
    data['long_description'] = longDescription;
    data['main_image'] = mainImage;
    data['big_image'] = bigImage;
    data['up_com_image'] = upComImage;
    data['video_url'] = videoUrl;
    data['discount'] = discount;
    data['sell_price'] = sellPrice;
    data['regular_price'] = regularPrice;
    data['sell_qty'] = sellQty;
    data['sell_count'] = sellCount;
    data['status'] = status;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    return data;
  }
}

class Category {
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

  Category(
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

  Category.fromJson(Map<String, dynamic> json) {
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
