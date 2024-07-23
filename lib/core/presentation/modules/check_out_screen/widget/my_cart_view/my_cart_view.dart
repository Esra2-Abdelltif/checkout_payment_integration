import 'package:checkout_payment_integration/core/presentation/modules/check_out_screen/widget/my_cart_view/widget/my_cart_view_body.dart';
import 'package:checkout_payment_integration/core/presentation/shared_widget/custom_app_bar_widget.dart';
import 'package:checkout_payment_integration/core/presentation/themes/size_config.dart';
import 'package:checkout_payment_integration/infrastructure/utils/functions/init_generic_variables_that_used_globally/init_generic_variables_that_used_globally.dart';
import 'package:flutter/material.dart';

class MyCartViewSection  extends StatelessWidget {
  const MyCartViewSection ({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    initGenericVariablesThatUsedGlobally(context);
    return const Scaffold(
      appBar: SharedAppBarInMobileView(
        title: "My Cart",
      ),
      body:MyCartViewBody()
    );
  }
}
