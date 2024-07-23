# checkout Payment integration

I show how to build a seamless checkout experience on mobile and web using Stripe and PayPal.

### ⚡  Flutter Stripe Payment Package

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
3. Create a PaymentIntent , Stripe uses this to represent your intent to collect payment from a customer.
   ```dart
   curl https://api.stripe.com/v1/payment_intents \
   -X "POST"

    ```
4. Integrate the payment sheet 
   ```dart
   Future initPaymentSheet({required String paymentIntentClientSecret}) async {
    await Stripe.instance.initPaymentSheet(
    paymentSheetParameters: SetupPaymentSheetParameters(
      paymentIntentClientSecret: paymentIntentClientSecret,
      merchantDisplayName: 'esraa',
     ),
   );
   }

   ```
5. displayPaymentSheet
   ```dart
   Stripe.instance.presentPaymentSheet();
    ```
   
6. makePayment
   ```dart
   
   Future makePayment(  {required PaymentIntentInputModel paymentIntentInputModel}) async {
   var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
   await initPaymentSheet(   paymentIntentClientSecret: paymentIntentModel.clientSecret!);
   await displayPaymentSheet();
   }
    ```
7. Create Ephemeral Key , Information on the Customer object is sensitive, and can’t be retrieved directly from an app. An Ephemeral Key grants the SDK temporary access to the Customer:
     ```dart
      Future<EphemeralKeyModel> createEphemeralKey( {required String customerId}) async {
      var response = await apiService.post(
        data: {'customer': customerId},
        endPoint:https://api.stripe.com/v1/ephemeral_keys,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers:{'Authorization': "Bearer $SecretKey",
          'Stripe-Version': '2023-08-16',
         },
        ));
     
       );

      var ephermeralKey = EphemeralKeyModel.fromJson(response);

      return ephermeralKey;
      }
      
    ```
  8. Create Customer (use an existing Customer ID if this is a returning customer)
     ```dart
        curl https://api.stripe.com/v1/customers \
       -X "POST"
  
### ⚡  Flutter PayPal Payment Package
