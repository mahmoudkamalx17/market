import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/core/networking/api_constants.dart';
import 'package:market/features/login/data/models/login_request_body.dart';
import 'package:market/features/login/data/repo/login_repo.dart';
import 'package:market/features/login/logic/cubit/login_state.dart';

import '../../../../core/database/cache_helper.dart';
import '../../../../core/di/dependency_injection.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;

  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey();

  static LoginCubit get(context) => BlocProvider.of(context);

  void emitSignUpStates() async {
    emit(const LoginState.loading());

    final response = await _loginRepo.login(LoginRequestBody(
      email: emailController.text,
      password: passwordController.text,
    ));

    response.when(
      success: (data) {
        getIt<CacheHelper>()
            .put(key: ApiConstants.primaryKey, value: emailController.text);
        emit(LoginState.success(data));
      },
      failure: (errorHandler) {
        emit(LoginState.error(message: errorHandler.toString()));
      },
    );
  }
}
