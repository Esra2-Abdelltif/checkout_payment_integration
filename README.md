# checkout Payment integration

I show how to build a seamless checkout experience on mobile and web using Stripe and PayPal.

### ⚡  Flutter Stripe Payment 

The Stripe Flutter SDK allows you to build delightful payment experiences in your native Android and iOS apps using Flutter.

## Installation

To install the Flutter Stripe Payment Package, follow these steps

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
      merchantDisplayName://DisplayName,
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
     curl https://api.stripe.com/v1/ephemeral_keys \
     -X "POST"   
    ```
  8. Create Customer (use an existing Customer ID if this is a returning customer)
     ```dart
        curl https://api.stripe.com/v1/customers \
       -X "POST"
  
### ⚡  Flutter PayPal Payment 

The Flutter PayPal Payment Package is a convenient solution that enables seamless integration of PayPal payments into your mobile application.

## Installation

To install the Flutter PayPal Payment Package, follow these steps

1. Add the package to your project's dependencies in the `pubspec.yaml` file:
   ```yaml
   dependencies:
     flutter_paypal_payment: ^1.0.0
    ``` 
2. Run the following command to fetch the package:

    ``` 
    flutter pub get
    ``` 

## Usage
1. Import the package into your Dart file:

    ``` 
    import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
    ```
2. Navigate to the PayPal checkout view with the desired configuration:
    ```dart
    PaypalCheckoutView(
    sandboxMode: true,
    clientId: "YOUR_CLIENT_ID",
    secretKey: "YOUR_SECRET_KEY",
    transactions: const [
        // Define your transaction details here
    ],
    onSuccess: (Map params) async {
        // Handle successful payment
   },
    onError: (error) {
        // Handle payment error
    },
    onCancel: () {
        // Handle payment cancellationImplement the onSuccess, onError, and onCancel callbacks to handle the respective payment outcomes.
    },
    );
    ```
### ⚡  Flutter PayMob Payment 
 integration of PayPal payments into your mobile application.

## Usage
1. Get Authantication Token:
   ```dart
     curl https://accept.paymob.com/api/auth/tokens \
     -X "POST"   
    ```
   
2.  Get Order Id by Using Authantication Token:
   ```dart
     curl https://accept.paymob.com/api/ecommerce/orders \
     -X "POST" 
   ```
3-Get PaymentKey by Using Authantication Token and  OrderId
 ```dart
     curl https://accept.paymob.com/api/acceptance/payment_keys \
     -X "POST" 
   ```
4-Open PayMob Screen 
 ```dart
     curl "https://accept.paymob.com/api/acceptance/iframes/$iframes?payment_token=$PaymentKey
   ```
