class DeleteItemCartModel {
  Data? data;
  String? message;

  num? status;

  DeleteItemCartModel({this.data, this.message, this.status});

  DeleteItemCartModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }

}

class Data {
  int? id;
  User? user;

  List<CartItems>? cartItems;

  Data({this.id, this.user, this.cartItems});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;

    if (json['cart_items'] != null) {
      cartItems = <CartItems>[];
      json['cart_items'].forEach((v) {
        cartItems!.add(CartItems.fromJson(v));
      });
    }
  }

}

class User {
  num? userId;
  String? userName;

  User({this.userId, this.userName});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userName = json['user_name'];
  }

}

class CartItems {
  int? itemId;
  num? itemProductId;
  String? itemProductName;
  String? itemProductImage;
  String? itemProductPrice;
  num? itemProductDiscount;
  num? itemProductPriceAfterDiscount;
  num? itemProductStock;
  num? itemQuantity;
  num? itemTotal;

  CartItems(
      {this.itemId,
        this.itemProductId,
        this.itemProductName,
        this.itemProductImage,
        this.itemProductPrice,
        this.itemProductDiscount,
        this.itemProductPriceAfterDiscount,
        this.itemProductStock,
        this.itemQuantity,
        this.itemTotal});

  CartItems.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    itemProductId = json['item_product_id'];
    itemProductName = json['item_product_name'];
    itemProductImage = json['item_product_image'];
    itemProductPrice = json['item_product_price'];
    itemProductDiscount = json['item_product_discount'];
    itemProductPriceAfterDiscount = json['item_product_price_after_discount'];
    itemProductStock = json['item_product_stock'];
    itemQuantity = json['item_quantity'];
    itemTotal = json['item_total'];
  }

}
