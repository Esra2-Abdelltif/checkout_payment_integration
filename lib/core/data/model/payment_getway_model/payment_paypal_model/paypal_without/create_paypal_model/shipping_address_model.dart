class ShippingAddressModel {
  String? recipientName;
  String? line1;
  String? line2;
  String? city;
  String? countryCode;
  String? postalCode;
  String? phone;
  String? state;

  ShippingAddressModel(
      {this.recipientName,
        this.line1,
        this.line2,
        this.city,
        this.countryCode,
        this.postalCode,
        this.phone,
        this.state});

  ShippingAddressModel.fromJson(Map<String, dynamic> json) {
    recipientName = json['recipient_name'];
    line1 = json['line1'];
    line2 = json['line2'];
    city = json['city'];
    countryCode = json['country_code'];
    postalCode = json['postal_code'];
    phone = json['phone'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =<String, dynamic>{};
    data['recipient_name'] = recipientName;
    data['line1'] = line1;
    data['line2'] = line2;
    data['city'] = city;
    data['country_code'] = countryCode;
    data['postal_code'] = postalCode;
    data['phone'] = phone;
    data['state'] = state;
    return data;
  }
}
