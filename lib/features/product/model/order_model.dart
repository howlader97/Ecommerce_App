// To parse this JSON data, do
//
//     final orderDetailsModel = orderDetailsModelFromJson(jsonString);

import 'dart:convert';

OrderDetailsModel orderDetailsModelFromJson(String str) => OrderDetailsModel.fromJson(json.decode(str));

String orderDetailsModelToJson(OrderDetailsModel data) => json.encode(data.toJson());

class OrderDetailsModel {
  int? id;
  int? customerId;
  int? shippingId;
  String? orderCode;
  int? cpnDiscAmt;
  DateTime? sellDate;
  int? discount;
  String? orderStatus;
  String? deliveryStatus;
  int? deliveryCharge;
  String? paymentMethod;
  String? paymentMobileNumber;
  String? vendorTxnId;
  int? vendorCharge;
  String? orderFrom;
  int? orderTotal;
  int? paidAmount;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<GetOrderDetailsInfo>? getOrderDetailsInfo;

  OrderDetailsModel({
    this.id,
    this.customerId,
    this.shippingId,
    this.orderCode,
    this.cpnDiscAmt,
    this.sellDate,
    this.discount,
    this.orderStatus,
    this.deliveryStatus,
    this.deliveryCharge,
    this.paymentMethod,
    this.paymentMobileNumber,
    this.vendorTxnId,
    this.vendorCharge,
    this.orderFrom,
    this.orderTotal,
    this.paidAmount,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.getOrderDetailsInfo,
  });

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) => OrderDetailsModel(
    id: json["id"],
    customerId: json["customer_id"],
    shippingId: json["shipping_id"],
    orderCode: json["order_code"],
    cpnDiscAmt: json["cpn_disc_amt"],
    sellDate: json["sell_date"] == null ? null : DateTime.parse(json["sell_date"]),
    discount: json["discount"],
    orderStatus: json["order_status"],
    deliveryStatus: json["delivery_status"],
    deliveryCharge: json["delivery_charge"],
    paymentMethod: json["payment_method"],
    paymentMobileNumber: json["payment_mobile_number"],
    vendorTxnId: json["vendor_txn_id"],
    vendorCharge: json["vendor_charge"],
    orderFrom: json["order_from"],
    orderTotal: json["order_total"],
    paidAmount: json["paid_amount"],
    deletedAt: json["deleted_at"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    getOrderDetailsInfo: json["get_order_details_info"] == null ? [] : List<GetOrderDetailsInfo>.from(json["get_order_details_info"]!.map((x) => GetOrderDetailsInfo.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "customer_id": customerId,
    "shipping_id": shippingId,
    "order_code": orderCode,
    "cpn_disc_amt": cpnDiscAmt,
    "sell_date": "${sellDate!.year.toString().padLeft(4, '0')}-${sellDate!.month.toString().padLeft(2, '0')}-${sellDate!.day.toString().padLeft(2, '0')}",
    "discount": discount,
    "order_status": orderStatus,
    "delivery_status": deliveryStatus,
    "delivery_charge": deliveryCharge,
    "payment_method": paymentMethod,
    "payment_mobile_number": paymentMobileNumber,
    "vendor_txn_id": vendorTxnId,
    "vendor_charge": vendorCharge,
    "order_from": orderFrom,
    "order_total": orderTotal,
    "paid_amount": paidAmount,
    "deleted_at": deletedAt,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "get_order_details_info": getOrderDetailsInfo == null ? [] : List<dynamic>.from(getOrderDetailsInfo!.map((x) => x.toJson())),
  };
}

class GetOrderDetailsInfo {
  int? id;
  int? orderId;
  int? productId;
  String? proName;
  String? proSize;
  String? proColor;
  String? proQty;
  int? proPrice;
  int? discount;
  DateTime? sellDate;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  GetOrderDetailsInfo({
    this.id,
    this.orderId,
    this.productId,
    this.proName,
    this.proSize,
    this.proColor,
    this.proQty,
    this.proPrice,
    this.discount,
    this.sellDate,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory GetOrderDetailsInfo.fromJson(Map<String, dynamic> json) => GetOrderDetailsInfo(
    id: json["id"],
    orderId: json["order_id"],
    productId: json["product_id"],
    proName: json["pro_name"],
    proSize: json["pro_size"],
    proColor: json["pro_color"],
    proQty: json["pro_qty"],
    proPrice: json["pro_price"],
    discount: json["discount"],
    sellDate: json["sell_date"] == null ? null : DateTime.parse(json["sell_date"]),
    deletedAt: json["deleted_at"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "order_id": orderId,
    "product_id": productId,
    "pro_name": proName,
    "pro_size": proSize,
    "pro_color": proColor,
    "pro_qty": proQty,
    "pro_price": proPrice,
    "discount": discount,
    "sell_date": "${sellDate!.year.toString().padLeft(4, '0')}-${sellDate!.month.toString().padLeft(2, '0')}-${sellDate!.day.toString().padLeft(2, '0')}",
    "deleted_at": deletedAt,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
