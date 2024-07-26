import 'dart:developer';
import 'package:checkout_payment_integration/core/data/model/payment_getway_model/payment_paymob_model/payment_paymob_model.dart';
import 'package:checkout_payment_integration/core/data/model/payment_getway_model/payment_paypal_model/paypal_without/create_paypal_model/create_paypal_model.dart';
import 'package:checkout_payment_integration/core/data/model/payment_getway_model/payment_stripe_model/create_customer/create_customer_request_model/create_customer_request_model.dart';
import 'package:checkout_payment_integration/core/data/model/payment_getway_model/payment_stripe_model/payment_model/payment_intent_request_model/payment_intent_request_model.dart';
import 'package:checkout_payment_integration/core/presentation/modules/check_out_screen/cubit/payment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:checkout_payment_integration/core/data/repositories/payment_repositories/payment_repo.dart';
import 'package:checkout_payment_integration/infrastructure/errors/exceptions/server_exceptions/server_exceptions.dart';
import 'package:checkout_payment_integration/infrastructure/singletones/registered_singletones.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());
  static PaymentCubit ofCurrentContext(context) =>
      BlocProvider.of<PaymentCubit>(context);

  ServerExceptions? serverException;
  late CreatePayPalPaymentResponseModel createPayPalPaymentResponseModel;
  String? url;

  ///makeStripePayment
  Future<void> makeStripePayment({required PaymentIntentRequestModel paymentIntentRequestModel,}) async {
    try {
      await _makeStripePayment(paymentIntentRequestModel: paymentIntentRequestModel,createCustomerRequestModel: CreateCustomerRequestModel(
        name: "Esraa Abdellatif"
      ));
    } catch (e) {
      emit(NoInternetConnectionState());
    }
  }

  Future<void> _makeStripePayment({required PaymentIntentRequestModel paymentIntentRequestModel,required CreateCustomerRequestModel createCustomerRequestModel}) async {
    emit(PaymentLoading());

    await getSingleton<PaymentStripeRepository>().makeStripePayment(paymentIntentRequestModel: paymentIntentRequestModel,createCustomerRequestModel: createCustomerRequestModel)
        .then((value) {
      value.fold((l) {
        serverException = l;
        emit(PaymentStripeFailure());
      }, (r) {

        emit(PaymentStripeSuccess());
      });
    });
  }


///makePayMobPayment
  Future<void> makePayMobPayment({required PaymentPayMobRequestModel paymentPayMobRequestModel }) async {
     try {
      await _makePayMobPayment(paymentPayMobRequestModel: paymentPayMobRequestModel);
    } catch (e) {
      emit(NoInternetConnectionState());
    }
  }
  Future<void> _makePayMobPayment({required PaymentPayMobRequestModel paymentPayMobRequestModel  }) async {
    emit(PaymentLoading());
    await getSingleton<PaymentStripeRepository>().makePayMobPayment(paymentPayMobRequestModel: paymentPayMobRequestModel)
        .then((value) {
      value.fold((l) {
        serverException = l;
        emit(PaymentPayMobFailure());
      }, (r) {
        url=r;
         emit(PaymentPayMobSuccess());

      });
    });
  }

  ///makePayPalPayment WithOut Package
  Future<void> makePayPalPayment({required double amount,required String currency}) async {
     try {
      await _makePayPalPayment(amount:amount,currency: currency, );
    } catch (e) {
      emit(NoInternetConnectionState());
    }
  }
  Future<void> _makePayPalPayment({required double amount,required String currency}) async {
    emit(PaymentLoading());
    await getSingleton<PaymentStripeRepository>().createPayPalPayment(amount:amount,currency: currency,sandboxMode: true)
        .then((value) {
      value.fold((l) {
        serverException = l;
        log(l.errorMessage!);
        emit(PaymentPayPalFailure());
      }, (r) {
        createPayPalPaymentResponseModel=r;
        emit(PaymentPayPalSuccess());

      });
    });
  }

}
