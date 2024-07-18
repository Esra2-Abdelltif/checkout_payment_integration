import 'package:checkout_payment_integration/core/presentation/shared_widget/custom_app_bar_widget.dart';
import 'package:checkout_payment_integration/core/presentation/themes/size_config.dart';
import 'package:checkout_payment_integration/infrastructure/utils/functions/init_generic_variables_that_used_globally/init_generic_variables_that_used_globally.dart';
import 'package:flutter/material.dart';

class MyCartSection  extends StatelessWidget {
  const MyCartSection ({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    initGenericVariablesThatUsedGlobally(context);
    return Scaffold(
      appBar: SharedAppBarInMobileView(
        title: "My Cart",
      ),
    );
  }
}
