import 'package:checkout_payment_integration/core/presentation/modules/check_out_screen/my_cart_view/my_cart_view.dart';
import 'package:flutter/material.dart';
BuildContext? mainContext;
void main() {
  runApp(const CheckoutApp());
}

class CheckoutApp extends StatelessWidget {
  const CheckoutApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter CheckoutApp Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,

      ),
      debugShowCheckedModeBanner: false,
      home: const MyCartSection(),
    );
  }
}

