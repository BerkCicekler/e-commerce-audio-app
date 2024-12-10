import 'package:bloc_test/bloc_test.dart';
import 'package:ecommerceaudio/product/bloc/auth_manager_bloc/auth_manager_bloc.dart';
import 'package:ecommerceaudio/product/models/request_models/login_request_model.dart';
import 'package:ecommerceaudio/product/models/request_models/oauth_request_model.dart';
import 'package:ecommerceaudio/product/models/request_models/register_request_model.dart';
import 'package:ecommerceaudio/product/models/response_models/sign_in_response_model.dart';
import 'package:ecommerceaudio/product/services/auth_service.dart';
import 'package:ecommerceaudio/product/services/oauth_services/i_oauth_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthService extends Mock implements AuthService {}

class MockOAuthSignInService extends Mock implements IOAuthSignInService {}

void main() {
  setUpAll(() {
    registerFallbackValue(LoginRequestModel('', ''));
    registerFallbackValue(RegisterRequestModel('', '', ''));
    registerFallbackValue(OAuthRequestModel('', '', ''));
  });

  group('Auth Manager Bloc', () {
    final mockAuthService = MockAuthService();
    final mockOAuthService = MockOAuthSignInService();
    final dummySignInRes = SignInResponseModel('', '', '', '');
    blocTest<AuthManagerBloc, AuthManagerState>(
      'Initial State is correct',
      build: () {
        return AuthManagerBloc(
          authService: mockAuthService,
        );
      },
      verify: (bloc) => [AuthManagerInitialState()],
    );

    blocTest<AuthManagerBloc, AuthManagerState>(
      'on SignIn Success state is right ',
      build: () {
        return AuthManagerBloc(
          authService: mockAuthService,
        );
      },
      setUp: () {
        when(() => mockAuthService.login(any()))
            .thenAnswer((_) async => dummySignInRes);
      },
      act: (bloc) => bloc.add(AuthPageOnButtonClickEvent('', '', '', true)),
      expect: () => [
        isA<AuthManagerLoadingState>(),
        isA<AuthManagerSuccessState>(),
      ],
    );

    blocTest<AuthManagerBloc, AuthManagerState>(
      'on SignUp Success state is right ',
      build: () {
        return AuthManagerBloc(
          authService: mockAuthService,
        );
      },
      setUp: () {
        when(() => mockAuthService.register(any()))
            .thenAnswer((_) async => dummySignInRes);
      },
      act: (bloc) => bloc.add(AuthPageOnButtonClickEvent('', '', '', false)),
      expect: () => [
        isA<AuthManagerLoadingState>(),
        isA<AuthManagerSuccessState>(),
      ],
    );

    blocTest<AuthManagerBloc, AuthManagerState>(
      'on SignIn Fail state is error ',
      build: () {
        return AuthManagerBloc(
          authService: mockAuthService,
        );
      },
      setUp: () {
        when(() => mockAuthService.login(any())).thenThrow(Exception());
      },
      act: (bloc) => bloc.add(AuthPageOnButtonClickEvent('', '', '', true)),
      expect: () => [
        isA<AuthManagerLoadingState>(),
        isA<AuthManagerErrorState>(),
      ],
    );

    blocTest<AuthManagerBloc, AuthManagerState>(
      'on SignUp fail state is error ',
      build: () {
        return AuthManagerBloc(
          authService: mockAuthService,
        );
      },
      setUp: () {
        when(() => mockAuthService.register(any())).thenThrow(Exception());
      },
      act: (bloc) => bloc.add(AuthPageOnButtonClickEvent('', '', '', false)),
      expect: () => [
        isA<AuthManagerLoadingState>(),
        isA<AuthManagerErrorState>(),
      ],
    );

    blocTest<AuthManagerBloc, AuthManagerState>(
      'on OAuth SignIn success ',
      build: () {
        return AuthManagerBloc(
          authService: mockAuthService,
        );
      },
      setUp: () {
        when(mockOAuthService.oAuthSignIn)
            .thenAnswer((_) async => OAuthRequestModel('', '', ''));
        when(() => mockAuthService.oAuthLogin(any()))
            .thenAnswer((_) async => dummySignInRes);
      },
      act: (bloc) => bloc.add(AuthPageOnOAuthSignInEvent(mockOAuthService)),
      expect: () => [
        isA<AuthManagerLoadingState>(),
        isA<AuthManagerSuccessState>(),
      ],
    );
  });
}
