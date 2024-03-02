import 'package:dio/dio.dart';
import 'package:market/core/networking/api_constants.dart';
import 'package:market/features/login/data/models/login_request_body.dart';
import 'package:market/features/login/data/models/login_response.dart';
import 'package:market/features/signup/data/models/sign_up_request_body.dart';
import 'package:market/features/signup/data/models/sign_up_response.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  //! Login
  @POST(ApiConstants.login)
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestBody,
  );

  //? SignUp
  @POST(ApiConstants.signup)
  Future<SignUpResponse> signUp(@Body() SignUpRequestBody signUpRequestBody);
}
