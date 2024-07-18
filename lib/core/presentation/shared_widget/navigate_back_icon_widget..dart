import 'package:checkout_payment_integration/core/presentation/constants/app_icons.dart';
import 'package:checkout_payment_integration/infrastructure/utils/extensions/navigation_extension.dart';
import 'package:flutter/material.dart';

class NavigateBackIconWidget extends StatelessWidget {
  final Color? color;
  final void Function()? onPressed;
  const NavigateBackIconWidget(
      {super.key, this.color , this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(AppIcons.backIcon,color:color??null,),
      onPressed:onPressed??
              () {
            context.popContext;
          },
    );
  }
}