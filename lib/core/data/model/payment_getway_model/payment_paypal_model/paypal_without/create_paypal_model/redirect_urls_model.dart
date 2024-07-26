class RedirectUrlsModel {
  String? returnUrl;
  String? cancelUrl;

  RedirectUrlsModel({this.returnUrl, this.cancelUrl});

  RedirectUrlsModel.fromJson(Map<String, dynamic> json) {
    returnUrl = json['return_url'];
    cancelUrl = json['cancel_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['return_url'] = returnUrl;
    data['cancel_url'] = cancelUrl;
    return data;
  }
}
