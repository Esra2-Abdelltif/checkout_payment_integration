import 'package:checkout_payment_integration/core/presentation/shared_widget/navigate_back_icon_widget..dart';
import 'package:checkout_payment_integration/core/presentation/shared_widget/shared_text/header_text.dart';
import 'package:flutter/material.dart';


class SharedAppBarInMobileView extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final void Function()? leadingOnPressed;
  const SharedAppBarInMobileView(
      {super.key,

        required this.title,
        this.leadingOnPressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      leading:  NavigateBackIconWidget(
        onPressed: leadingOnPressed,
      ),
      title: AppBaHeaderText(
        text: title,
        fontWeight: FontWeight.w500,
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.transparent,
      centerTitle: true,
    );
  }

  static final _appBar = AppBar();

  @override
  Size get preferredSize => _appBar.preferredSize;
}