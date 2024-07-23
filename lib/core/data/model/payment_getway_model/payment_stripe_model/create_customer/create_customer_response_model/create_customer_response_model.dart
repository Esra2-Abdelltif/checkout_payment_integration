class CreateCustomersResponseModel {
  String? id;
  String? object;
  String? email;
  String? invoicePrefix;
  String? name;



  CreateCustomersResponseModel({this.id, this.object, this.email, this.invoicePrefix, this.name, });

  CreateCustomersResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    object = json['object'];
    email = json['email'];
    invoicePrefix = json['invoice_prefix'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['object'] = object;
    data['email'] = email;
    data['invoice_prefix'] = invoicePrefix;
    return data;
  }
}

