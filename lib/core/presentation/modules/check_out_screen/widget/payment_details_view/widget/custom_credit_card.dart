import 'package:checkout_payment_integration/core/presentation/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CustomCreditCard extends StatefulWidget {
  final GlobalKey<FormState> formKey;
   final AutovalidateMode autovalidateMode;

  const CustomCreditCard({
        super.key,
        required this.formKey,
        required this.autovalidateMode
  });

  @override
  State<CustomCreditCard> createState() => _CustomCreditCardState();
}

class _CustomCreditCardState extends State<CustomCreditCard> {
  String cardNumber = '', expiryDate = '', cardHolderName = '', cvvCode = '';
  bool showBackView = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          CreditCardWidget(
            padding: 0,
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            showBackView: showBackView,
            isHolderNameVisible: true,
            onCreditCardWidgetChange: (value) {},
              cardBgColor: AppColors.primaryColor,
            animationDuration: const Duration(milliseconds: 600),

          ),
          CreditCardForm(
              isHolderNameVisible: true,
              autovalidateMode: widget.autovalidateMode,
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              onCreditCardModelChange: (carditCardModel) {
                cardHolderName = carditCardModel.cardHolderName;
                expiryDate = carditCardModel.expiryDate;
                cvvCode = carditCardModel.cvvCode;
                cardNumber = carditCardModel.cardNumber;
                //Bthndl card inh y3rd cvv fe makanh fe back
                showBackView = carditCardModel.isCvvFocused;
                setState(() {});
              },
              formKey: widget.formKey),
        ],
      ),
    );
  }
}
