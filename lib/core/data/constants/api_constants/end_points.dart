const String baseStripeUrlValue = "https://api.stripe.com/v1";
const String basePayPalUrlValue = "https://accept.paymob.com/api";


//Stripe
const String createPaymentIntentEndPoint = '$baseStripeUrlValue/payment_intents';
const String ephemeralKeysEndPoint = '$baseStripeUrlValue/ephemeral_keys';
const String createCustomerEndPoint = '$baseStripeUrlValue/customers';
//paymob
const String authanticationTokenEndPoint = '$basePayPalUrlValue/auth/tokens';
const String orderIdEndPoint = '$basePayPalUrlValue/ecommerce/orders';
const String paymentKeyEndPoint = '$basePayPalUrlValue/acceptance/payment_keys';
