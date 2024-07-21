import 'package:checkout_payment_integration/core/presentation/constants/app_colors.dart';
import 'package:checkout_payment_integration/core/presentation/modules/check_out_screen/my_cart_view/my_cart_view.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
BuildContext? mainContext;
void main() {
  runApp((DevicePreview(
    enabled: true,
    builder: (context) => const CheckoutApp(),
  )));
}

class CheckoutApp extends StatelessWidget {
  const CheckoutApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Flutter CheckoutApp Demo',
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor:AppColors.primaryColor,),
        useMaterial3: true,

      ),
      debugShowCheckedModeBanner: false,
      home: const MyCartViewSection(),
    );
  }
}

// PaymentIntentModel create payment intent(amount , currency , customerId)
// keySecret createEphemeralKey( customerId)
// initPaymentSheet (merchantDisplayName , intentClientSecret , ephemeralKeySecret)
// presentPaymentSheet()