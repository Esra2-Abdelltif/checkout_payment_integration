# checkout Payment integration

I show how to build a seamless checkout experience on mobile and web using Stripe and PayPal.

## Flutter Stripe Payment Package

Stripe is a popular payment processing platform that allows businesses to accept online payments . This plugin provides tools to handle payment flows, such as setting up payment methods, creating payments , and managing subscriptions. It's commonly used for e-commerce apps and other platforms that require payment processing .


## Installation

To install the Flutter PayPal Payment Package, follow these steps

1. Add the package to your project's dependencies in the `pubspec.yaml` file:
   ```yaml
   dependencies:
     flutter_stripe: ^10.2.0
    ``` 
2. Run the following command to fetch the package:

    ``` 
    flutter pub get
    ``` 

## Usage
1. Import the package into your Dart file:

    ``` 
   import 'package:flutter_stripe/flutter_stripe.dart';
    ```
2. When your app starts, configure the SDK with your Stripe publishable key so that it can make requests to the Stripe API:
   ```dart
    void main() async {
   
    Stripe.publishableKey = stripePublishableKey;
   
   runApp(const App());
   }
    ```
3. Create a PaymentIntent:
   Stripe uses this to represent your intent to collect payment from a customer.
   ```dart
   curl https://api.stripe.com/v1/payment_intents \

    ```
   
