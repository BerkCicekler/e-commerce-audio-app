import 'package:ecommerceaudio/product/models/base_response_model.dart';
import 'package:ecommerceaudio/product/models/request_models/login_request_model.dart';
import 'package:ecommerceaudio/product/models/request_models/register_request_model.dart';
import 'package:ecommerceaudio/product/models/response_models/sign_in_response_model.dart';
import 'package:ecommerceaudio/product/models/user.dart';
import 'package:ecommerceaudio/product/services/auth_service.dart';
import 'package:ecommerceaudio/product/services/network_service.dart';
import 'package:ecommerceaudio/product/services/oauth_services/i_oauth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

part 'auth_manager_event.dart';
part 'auth_manager_state.dart';

final class AuthManagerBloc extends Bloc<AuthPageEvent, AuthManagerState> {
  AuthManagerBloc({
    required this.authService,
  }) : super(AuthManagerInitialState()) {
    on<AuthPageOnButtonClickEvent>(_onAuthPageButtonClick);
    on<AuthPageOnOAuthSignInEvent>(_oAuthSignIn);
    on<AuthSignOutEvent>(_authSignOut);
  }

  final AuthService authService;

  Future<void> _onAuthPageButtonClick(
    AuthPageOnButtonClickEvent event,
    Emitter<AuthManagerState> emit,
  ) async {
    if (state is AuthManagerLoadingState) {
      return;
    }
    emit(AuthManagerLoadingState());
    try {
      late final BaseResponse response;
      if (event.isSignIn) {
        response = await authService.login(
          LoginRequestModel(
            event.email,
            event.password,
          ),
        );
      } else {
        response = await authService.register(
          RegisterRequestModel(
            event.userName,
            event.email,
            event.password,
          ),
        );
      }
      _successfullySingIn(response, emit);
    } catch (e) {
      emit(AuthManagerErrorState(e.toString()));
      Logger().e(e);
      return;
    }
  }

  Future<void> _oAuthSignIn(
    AuthPageOnOAuthSignInEvent event,
    Emitter<AuthManagerState> emit,
  ) async {
    if (state is AuthManagerLoadingState) {
      return;
    }
    emit(AuthManagerLoadingState());
    try {
      final oAuthData = await event.oAuthService.oAuthSignIn();
      if (oAuthData == null) {
        return;
      }
      final response = await authService.oAuthLogin(oAuthData);
      _successfullySingIn(response, emit);
    } catch (e) {
      emit(AuthManagerErrorState(e.toString()));
      Logger().e(e);
    }
  }

  void _successfullySingIn(
    BaseResponse responseModel,
    Emitter<AuthManagerState> emit,
  ) {
    final loginResponseModel = SignInResponseModel.fromJson(responseModel.data);
    NetworkService.instance.setAccessToken(loginResponseModel.token);
    emit(
      AuthManagerSuccessState(
        User(
          name: loginResponseModel.userName,
          email: loginResponseModel.email,
        ),
      ),
    );
  }

  void _authSignOut(AuthSignOutEvent event, Emitter<AuthManagerState> emit) {
    emit(AuthManagerInitialState());
  }
}
