import 'package:checkout_payment_integration/infrastructure/services/remote/local/payment_service/paypal_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class PayPalCheckoutView  extends StatefulWidget {
  final String? checkoutUrl ;
  final Function onSuccess, onCancel, onError;
  const PayPalCheckoutView({super.key,  this.checkoutUrl ,required this.onSuccess,required this.onError,required this.onCancel,});

  @override
  State<PayPalCheckoutView> createState() => _PayPalCheckoutViewState();
}

class _PayPalCheckoutViewState extends State<PayPalCheckoutView> {
  double progress = 0;
  late InAppWebViewController webView;

  @override
  void initState() {
    super.initState();
    setState(() {
    });
  }


  @override
  Widget build(BuildContext context) {
    if (widget.checkoutUrl != null) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Paypal Payment",
          ),
        ),
        body: Stack(
          children: <Widget>[
            InAppWebView(
              shouldOverrideUrlLoading: (controller, navigationAction) async {
                final url = navigationAction.request.url;

                if (url.toString().contains("'https://www.facebook.com/tharwat.samy.9'")) {
                  exceutePayment(url, context);
                  return NavigationActionPolicy.CANCEL;
                }
                if (url.toString().contains("'https://www.facebook.com/tharwat.samy.9'")) {
                  return NavigationActionPolicy.CANCEL;
                } else {
                  return NavigationActionPolicy.ALLOW;
                }
              },
              initialUrlRequest: URLRequest(url: Uri.parse(widget.checkoutUrl!)),
              initialOptions: InAppWebViewGroupOptions(
                crossPlatform: InAppWebViewOptions(
                  useShouldOverrideUrlLoading: true,
                ),
              ),
              onWebViewCreated: (InAppWebViewController controller) {
                webView = controller;
              },
              onCloseWindow: (InAppWebViewController controller) {
                widget.onCancel();
              },
              onProgressChanged:
                  (InAppWebViewController controller, int progress) {
                setState(() {
                  this.progress = progress / 100;
                });
              },
            ),
            progress < 1
                ? SizedBox(
              height: 3,
              child: LinearProgressIndicator(
                value: progress,
              ),
            )
                : const SizedBox(),
          ],
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Paypal Payment",
          ),
        ),
        body:const Center(
            child:
            CircularProgressIndicator()),
      );
    }
  }

  void exceutePayment(url, BuildContext context) {
    final payerID = url!.queryParameters['PayerID'];
    PayPalService palService=PayPalService();
    if (payerID != null) {
      palService.executePayment(sandboxMode: true, payerId: payerID,url: widget.checkoutUrl).then(
            (id) {
          if (id['error'] == false) {
            widget.onSuccess(id);
          } else {
            widget.onError(id);
          }
        },
      );
    } else {
      widget.onError('Something went wront PayerID == null');
    }
  }
}

