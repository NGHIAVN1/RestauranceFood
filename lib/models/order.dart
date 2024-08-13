import 'dart:ffi';

class Order {
  String? orderId;
  String? userId;
  String? orderDay;
  String? deliveryAddress;
  Int? totalAmount;
  bool? orderStatus;

  Order({
    this.orderId,
    this.userId,
    this.orderDay,
    this.deliveryAddress,
    this.totalAmount,
    this.orderStatus,
  });
  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      orderId: json['orderId'],
      userId: json['userId'],
      orderDay: json['orderDay'],
      deliveryAddress: json['deliveryAddress'],
      totalAmount: json['totalAmount'],
      orderStatus: json['orderStatus'],
    );
  }
}
