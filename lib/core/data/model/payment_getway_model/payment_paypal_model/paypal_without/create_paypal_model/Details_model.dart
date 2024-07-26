class DetailsModel {
  String? subtotal;
  String? tax;
  String? shipping;
  String? handlingFee;
  String? shippingDiscount;
  String? insurance;

  DetailsModel(
      {this.subtotal,
        this.tax,
        this.shipping,
        this.handlingFee,
        this.shippingDiscount,
        this.insurance});

  DetailsModel.fromJson(Map<String, dynamic> json) {
    subtotal = json['subtotal'];
    tax = json['tax'];
    shipping = json['shipping'];
    handlingFee = json['handling_fee'];
    shippingDiscount = json['shipping_discount'];
    insurance = json['insurance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =<String, dynamic>{};
    data['subtotal'] = subtotal;
    data['tax'] = tax;
    data['shipping'] = shipping;
    data['handling_fee'] = handlingFee;
    data['shipping_discount'] = shippingDiscount;
    data['insurance'] = insurance;
    return data;
  }
}
