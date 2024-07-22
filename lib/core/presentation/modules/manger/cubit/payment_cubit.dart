import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:checkout_payment_integration/core/data/model/payment_model/payment_intent_input_model/payment_intent_input_model.dart';
import 'package:checkout_payment_integration/core/data/repositories/payment_repositories/payment_repo.dart';
import 'package:checkout_payment_integration/core/presentation/modules/manger/cubit/payment_state.dart';
import 'package:checkout_payment_integration/infrastructure/errors/exceptions/server_exceptions/server_exceptions.dart';
import 'package:checkout_payment_integration/infrastructure/singletones/registered_singletones.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());
  static PaymentCubit ofCurrentContext(context) =>
      BlocProvider.of<PaymentCubit>(context);

  ServerExceptions? serverException;
  late PaymentIntentInputModel paymentIntentInputModel;


  Future<void> makePayment({required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await _makePayment(paymentIntentInputModel: paymentIntentInputModel);
    } catch (e) {
      emit(NoInternetConnectionState());
    }
  }

  Future<void> _makePayment({required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(PaymentLoading());

    await getSingleton<PaymentStripeRepository>().makePayment(paymentIntentInputModel: paymentIntentInputModel)
        .then((value) {
      value.fold((l) {
        serverException = l;
        emit(PaymentFailure());
      }, (r) {
        emit(PaymentSuccess());
      });
    });
  }

  @override
  void onChange(Change<PaymentState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
