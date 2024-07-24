import 'package:checkout_payment_integration/core/presentation/shared_widget/custom_app_bar_widget.dart';
import 'package:checkout_payment_integration/infrastructure/utils/extensions/navigation_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class PayMobCheckoutView  extends StatefulWidget {
  final String url;
  final Widget    nextScreenIfSuccess;
  final Widget  nextScreenIfError;
  const PayMobCheckoutView({super.key, required this.url,required this.nextScreenIfSuccess,required this.nextScreenIfError,});

  @override
  State<PayMobCheckoutView> createState() => _PayMobCheckoutViewState();
}

class _PayMobCheckoutViewState extends State<PayMobCheckoutView> {
  double _progress = 0;
  late InAppWebViewController inAppWebViewController;

  @override
  void initState() {
    super.initState();
    setState(() {
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const SharedAppBarInMobileView(
          title: "Paymob Payment",
        ),
        body: Stack(
          children: <Widget>[
            InAppWebView(
              initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
              initialOptions: InAppWebViewGroupOptions(
                crossPlatform: InAppWebViewOptions(
                    useShouldOverrideUrlLoading: true,
                    javaScriptEnabled: true),
              ),
              onWebViewCreated: (InAppWebViewController controller) {
                inAppWebViewController = controller;
                // startPayment();
              },
              onLoadStop: (InAppWebViewController controller, url) {
                if (url != null &&
                    url.queryParameters.containsKey("success") &&
                    url.queryParameters["success"] == 'true') {
                  context.pushReplacementContext(route: widget.nextScreenIfSuccess);
                } else if (url != null &&
                    url.queryParameters.containsKey("success") &&
                    url.queryParameters["success"] == 'false') {
                  context.pushReplacementContext(route:  widget.nextScreenIfError);

                }
              },


              onCloseWindow: (InAppWebViewController controller) {
                context.popContext;
              },
              onProgressChanged: (InAppWebViewController controller, int progress) {
                setState(() {
                  this._progress = progress / 100;
                });
              },
            ),
            _progress < 1
                ? SizedBox(
              height: 3,
              child: LinearProgressIndicator(
                value: _progress,
              ),
            )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
