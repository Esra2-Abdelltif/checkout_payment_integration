const String baseStripeUrlValue = "https://api.stripe.com/v1";
const String basePayMobUrlValue = "https://accept.paymob.com/api";
 const String basePayPalUrlSandboxValue = "https://api.sandbox.paypal.com";
const String basePayPalUrlValue = "https://api.paypal.com";


//Stripe
const String createPaymentIntentEndPoint = '$baseStripeUrlValue/payment_intents';
const String ephemeralKeysEndPoint = '$baseStripeUrlValue/ephemeral_keys';
const String createCustomerEndPoint = '$baseStripeUrlValue/customers';
//paymob
const String authanticationTokenEndPoint = '$basePayMobUrlValue/auth/tokens';
const String orderIdEndPoint = '$basePayMobUrlValue/ecommerce/orders';
const String paymentKeyEndPoint = '$basePayMobUrlValue/acceptance/payment_keys';

//paypal
 String accessTokenEndPoint({required bool sandboxMode}) => '${sandboxMode?basePayPalUrlSandboxValue:basePayPalUrlValue}/v1/oauth2/token';
String createPaypalPaymentEndPoint({required bool sandboxMode}) => '${sandboxMode?basePayPalUrlSandboxValue:basePayPalUrlValue}/v1/payments/payment';
String executePaypalPaymentEndPoint({required bool sandboxMode,required String paymentId}) => '${createPaypalPaymentEndPoint(sandboxMode: sandboxMode)}/$paymentId/execute';
