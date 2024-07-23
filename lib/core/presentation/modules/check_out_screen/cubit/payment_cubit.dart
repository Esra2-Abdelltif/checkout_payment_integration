import 'package:checkout_payment_integration/core/data/model/payment_getway_model/payment_stripe_model/create_customer/create_customer_request_model/create_customer_request_model.dart';
import 'package:checkout_payment_integration/core/data/model/payment_getway_model/payment_stripe_model/create_customer/create_customer_response_model/create_customer_response_model.dart';
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
  late CreateCustomersResponseModel createCustomerRequestModel;
  String customerId='';


  Future<void> makePayment({required PaymentIntentRequestModel paymentIntentRequestModel}) async {
    try {
      await _makePayment(paymentIntentRequestModel: paymentIntentRequestModel);
    } catch (e) {
      emit(NoInternetConnectionState());
    }
  }

  Future<void> _makePayment({required PaymentIntentRequestModel paymentIntentRequestModel}) async {
    emit(PaymentLoading());

    await getSingleton<PaymentStripeRepository>().makePayment(paymentIntentRequestModel: paymentIntentRequestModel)
        .then((value) {
      value.fold((l) {
        serverException = l;
        emit(PaymentFailure());
      }, (r) {
        emit(PaymentSuccess());
      });
    });
  }


  Future<void> createCustomer() async {
    try {
      await _createCustomer(createCustomerRequestModel: CreateCustomerRequestModel(
        name: "Eso"
      ));
    } catch (e) {
      emit(NoInternetConnectionState());
    }
  }

  Future<void> _createCustomer({required CreateCustomerRequestModel createCustomerRequestModel}) async {
    emit(CreateCustomerLoading());

    await getSingleton<PaymentStripeRepository>().createCustomer(createCustomerRequestModel: createCustomerRequestModel)
        .then((value) {
      value.fold((l) {
        serverException = l;
        emit(CreateCustomerFailure());
      }, (r) {
        customerId=r.id!;
        print("customerId : ${customerId}");
        print("r.id! : ${r.id!}");
        emit(CreateCustomerSuccess());

      });
    });
  }


}
