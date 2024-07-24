import 'package:checkout_payment_integration/core/presentation/modules/check_out_screen/cubit/payment_cubit.dart';
import 'package:checkout_payment_integration/core/presentation/modules/check_out_screen/cubit/payment_state.dart';
import 'package:checkout_payment_integration/infrastructure/utils/extensions/navigation_extension.dart';
import 'package:flutter/material.dart';
import '../widget/thank_you_view/thank_you_view.dart';

class PaymentListenerOnStates {
  static void listenerOnStates(
    state,
    BuildContext context,
      PaymentCubit paymentCubit,
  ) {

    if (state is PaymentStripeSuccess) {
      context.pushReplacementContext(route: const ThankYouView());
    }
    if (state is PaymentStripeFailure) {
      context.popContext();
      SnackBar snackBar = SnackBar(content: Text(paymentCubit.serverException!.errorMessage!));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    if (state is PaymentStripeFailure) {
      context.popContext();
      SnackBar snackBar = SnackBar(content: Text(paymentCubit.serverException!.errorMessage!));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    if (state is NoInternetConnectionState) {
      context.popContext();

      SnackBar snackBar = const SnackBar(content: Text("Check your internet connection"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    }

}






















/* Previous CODE
import 'package:animate_do/animate_do.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:juthor/core/data/constants/locales/locale_keys.dart';
import 'package:juthor/core/presentation/layouts/home_layout/home_layout_cubit/home_layout_cubit.dart';
import 'package:juthor/core/presentation/layouts/home_layout/home_layout_cubit/home_layout_states.dart';
import 'package:juthor/core/presentation/shared_widgets/shared_progress_indicator.dart';
import 'package:juthor/core/themes/app_spaces.dart';
import 'package:juthor/infrastructure/utils/extensions/navigation_extension.dart';
import 'package:juthor/infrastructure/utils/extensions/translator_extension.dart';
import 'package:juthor/infrastructure/utils/functions/show_dialog.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../../../../infrastructure/utils/functions/states_manager.dart';
import '../../../../../../themes/app_colors.dart';
import '../../../../../shared_widgets/shared_texts/caption_text.dart';
import 'create_expense_cubit/mark_as_sold_cubit.dart';
import 'create_expense_cubit/mark_as_sold_states.dart';

class CreateExpenseContainerListenerOnStates {
  static void listenerOnStates(
    state,
    BuildContext context,
    CreateExpenseScreenCubit createExpenseCubit,
  ) {
    if (state is SaveExpenseSendingRequestState) {
      dialogWithBlurBackground(
        context: context,
        isAbsorbed: true,
        content: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => createExpenseCubit,
            ),
            BlocProvider(
              create: (context) =>
                  createExpenseCubit.expenseScreenCubit.homeLayoutCubit,
            ),
          ],
          //The Bloc Builder here is assigned to HomeLayoutCubit cause we wanna listen on
          //the progress of the file uploading function which is in the HomeLayoutCubit
          child: BlocBuilder<HomeLayoutCubit, HomeLayoutStates>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: ConditionalBuilder(
                  condition: state is FileUploadingProgressChangeState,
                  builder: (context) => ShowUploadingFileProgressContainer(
                    currentCubit: createExpenseCubit,
                  ),
                  fallback: (context) => ConditionalBuilder(
                    condition: state is SendingRequestCreatingExpenseState,
                    builder: (context) => FadeIn(
                      duration: const Duration(milliseconds: 200),
                      child: Column(
                        children: [
                          const SharedProgressIndicator(),
                          AppSpaces.vSpace20,
                          CaptionText(
                              text: LocaleKeys.creatingNewExpense.translate)
                        ],
                      ),
                    ),
                    fallback: (context) => FadeIn(
                      child: Column(
                        children: [
                          const SharedProgressIndicator(),
                          AppSpaces.vSpace20,
                          CaptionText(text: LocaleKeys.saving.translate),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      );
    }

    if (state is CreateExpenseNoInternetConnectionState) {
      StatesManager.showToastWhenNoInternetConnectionState();
      _onFailedToCreateExpense(context);
    }
    
    if (state is FileFailedToUploadState) {
      StatesManager.showToastWhenFailedState(
        onFailedMessage: createExpenseCubit.serverException!.errorMessage!,
        actionAfterFailed: _onFailedToCreateExpense(context),
      );
    }

    if (state is CreateExpenseFailedState) {
      _onFailedToCreateExpense(context);
    }

    if (state is CreatedExpenseSuccessfullyState) {
      StatesManager.showToastWhenSuccessState(
        onSuccessMessage: LocaleKeys.expenseAddedSuccessfully.translate,
        actionAfterSuccess: _onSuccessfulCreateExpense(context),
      );
    }
  }

  static _onSuccessfulCreateExpense(BuildContext context) {
    context.pop; //Pop the last screen of creating a new expense
    context.pop; //Then pop the create expense container
  }

  static _onFailedToCreateExpense(BuildContext context) {
    context.pop;
  }
}

class ShowUploadingFileProgressContainer extends StatelessWidget {
  final dynamic currentCubit;
  const ShowUploadingFileProgressContainer(
      {Key? key, required this.currentCubit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 200),
      child: Column(
        children: [
          CircularPercentIndicator(
            radius: 70.0,
            center: CaptionText(
              text:
                  "${currentCubit.expenseScreenCubit.homeLayoutCubit.uploadingProgress.toInt()} %",
            ),
            animation: true,
            animationDuration: 1500,
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: AppColors.primaryColor,
            animateFromLastPercent: true,
            percent: currentCubit
                    .expenseScreenCubit.homeLayoutCubit.uploadingProgress /
                100,
            backgroundColor: AppColors.primaryColor.withOpacity(0.3),
            lineWidth: 15.0,
          ),
          AppSpaces.vSpace10,
          CaptionText(
              text:
                  '${LocaleKeys.uploadingFile.translate} ${HomeLayoutCubit.ofCurrentContext(context).filePickerResult!.files.single.name}'),
          AppSpaces.vSpace10,
        ],
      ),
    );
  }
}



 */