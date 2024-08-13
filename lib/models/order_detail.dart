class OrderDetail {
  final String id;
  final String orderId;
  final String productId;
  final String productName;
  final String productImage;
  final double price;
  final int quantity;
  final double total;

  OrderDetail({
    required this.id,
    required this.orderId,
    required this.productId,
    required this.productName,
    required this.productImage,
    required this.price,
    required this.quantity,
    required this.total,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) {
    return OrderDetail(
      id: json['id'],
      orderId: json['order_id'],
      productId: json['product_id'],
      productName: json['product_name'],
      productImage: json['product_image'],
      price: json['price'],
      quantity: json['quantity'],
      total: json['total'],
    );
  }
}