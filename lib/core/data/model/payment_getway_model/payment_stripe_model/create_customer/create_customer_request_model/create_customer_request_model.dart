class CreateCustomerRequestModel {

  final String name;
  final String? email;

  CreateCustomerRequestModel(
      { required this.name,
        this.email});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (email != null)  data['email'] = email!;
     data['name'] = name;

    return data;
  }
}
