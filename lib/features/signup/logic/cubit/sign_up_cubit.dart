import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/core/networking/api_constants.dart';
import 'package:market/features/signup/data/models/sign_up_request_body.dart';
import 'package:market/features/signup/data/repo/sign_up_repo.dart';
import 'package:market/features/signup/logic/cubit/sign_up_state.dart';

import '../../../../core/database/cache_helper.dart';
import '../../../../core/di/dependency_injection.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepo _signUpRepo;

  SignUpCubit(this._signUpRepo) : super(const SignUpState.initial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  GlobalKey<FormState> signUpFormKey = GlobalKey();

  static SignUpCubit get(context) => BlocProvider.of(context);

  void emitSignUpStates() async {
    emit(const SignUpState.loading());

    final response = await _signUpRepo.signUp(
      SignUpRequestBody(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        passwordConfirm: passwordConfirmController.text,
      ),
    );

    response.when(
      success: (data) {
        getIt<CacheHelper>()
            .put(key: ApiConstants.primaryKey, value: emailController.text);
        emit(SignUpState.success(data));
      },
      failure: (errorHandler) {
        emit(SignUpState.error(message: errorHandler.toString()));
      },
    );
  }
}
