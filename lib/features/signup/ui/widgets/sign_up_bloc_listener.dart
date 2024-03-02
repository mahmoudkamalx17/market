import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/core/helper/extentions.dart';
import 'package:market/core/routes/routes.dart';
import 'package:market/features/signup/logic/cubit/sign_up_cubit.dart';
import 'package:market/features/signup/logic/cubit/sign_up_state.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
          success: (data) {
            setupSuccessState(context);
          },
          error: (error) {
            setupErrorState(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupSuccessState(BuildContext context) {
    context.navigatePop();
    context.navigateToReplacement(Routes.loginScreen);
  }

  void setupErrorState(BuildContext context, String error) {
    context.navigatePop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          error,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.navigatePop();
            },
            child: const Text(
              'Got it',
            ),
          ),
        ],
      ),
    );
  }
}
