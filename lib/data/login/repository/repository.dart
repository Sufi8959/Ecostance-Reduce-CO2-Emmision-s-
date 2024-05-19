import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:net_carbons/app/constants/string_constants.dart';
import 'package:net_carbons/app/dependency.dart';
import 'package:net_carbons/data/core/general/failiure.dart';
import 'package:net_carbons/data/core/mapper/mapper.dart';
import 'package:net_carbons/data/core/network/app_api.dart';
import 'package:net_carbons/data/core/network/dio.dart';
import 'package:net_carbons/domain/auth/model/modals.dart';
import 'package:net_carbons/domain/login/i_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../authentication_response/authentication_response.dart';

class LoginRepository implements ILoginRepository {
  final SharedPreferences sharedPreferences;
  final dio = getIt<DioManager>();
  AppApi appApi = getIt<AppApi>();
  LoginRepository({required this.sharedPreferences});
  @override
  Future<Either<Failure, AuthDataModal>> login(
      LoginRequest loginRequest) async {
    try {
      final resp = await dio.post('/auth/login', data: {
        'userId': loginRequest.userId,
        'password': loginRequest.password,
        'strategy': loginRequest.strategy,
        'origin': 'mobile'
      },
          additionalHeaders: {
        'device': "${Platform.isIOS ? 'iOS' : 'Android'} Mobile"
      }
      );

      if (resp.statusCode == 200) {
        final response = AuthenticationResponse.fromJson(resp.data);

        return Right(response.toDomain());
      } else if (resp.statusCode == 401) {
        return Left(AccountHold(message: resp.data['message']));
      } else {
        return Left(ServerFailure(message: resp.data['message'])
            .orGeneric("Something went wrong. Please try again later."));
      }
    } on SocketException catch (e) {
      return Left(ClientFailure(message: 'Internet connection failed')
          .orGeneric("Internet connection failed"));
    } on DioError catch (e) {
      if (e.response?.data['code'].toString() == "ACCOUNT_HOLD") {
        return Left(AccountHold(
            message: e.response?.data['message'] ?? 'Unknown Error'));
      }
      //FirebaseCrashlytics.instance.recordError(e, StackTrace.current);
      return Left(ClientFailure(
          message: e.response?.data['message'] ??
              'Something went wrong. Please try again later.'));
    } catch (e) {
      return Left(ClientFailure(message: 'Unable to login')
          .orGeneric("Something went wrong. Please try again later."));
    }
  }

  @override
  Future<Either<Failure, dynamic>> setCurrency(String currency) async {
    try {
      final resp =
          await dio.post('/auth/set-currency', data: {'currency': currency});

      if (resp.statusCode == 200) {
        return Right(resp.statusCode);
      } else if (resp.statusCode == 401) {
        return Left(AccountHold(message: resp.data['message'])
            .orGeneric("Wrong username or password"));
      } else {
        return Left(ServerFailure(message: resp.data['message'])
            .orGeneric("Something went wrong. Please try again later."));
      }
    } on SocketException catch (e) {
      print(e);
      return Left(ClientFailure(message: 'Internet connection failed')
          .orGeneric("Internet connection failed"));
    } on DioError catch (e) {
      //FirebaseCrashlytics.instance.recordError(e, StackTrace.current);
      print(e);
      return Left(ClientFailure(message: e.response.toString())
          .orGeneric("Something went wrong. Please try again later."));
    }
  }

  Future<Either<Failure, dynamic>> getCurrency(String currency) async {
    try {
      final resp = await dio.get('/auth/get-currency');

      if (resp.statusCode == 200) {
        return Right(resp.statusCode);
      } else if (resp.statusCode == 401) {
        return Left(AccountHold(message: resp.data['message'])
            .orGeneric("Unknown error"));
      } else {
        return Left(ServerFailure(message: resp.data['message'])
            .orGeneric("Something went wrong. Please try again later."));
      }
    } on SocketException catch (e) {
      return Left(ClientFailure(message: 'Internet connection failed')
          .orGeneric("Internet connection failed"));
    } on DioError catch (e) {
      //FirebaseCrashlytics.instance.recordError(e, StackTrace.current);
      return Left(ClientFailure(message: e.response.toString())
          .orGeneric("Something went wrong. Please try again later."));
    }
  }

  @override
  Future<Either<bool, AuthDataModal>> checkHasUser() async {
    final bool hasToken = sharedPreferences.containsKey(AppStrings.TOKEN);
    if (hasToken) {
      final token = sharedPreferences.getString(AppStrings.TOKEN);
      final email = sharedPreferences.getString(AppStrings.EMAIL);
      final uid = sharedPreferences.getString(AppStrings.UID);
      final id = sharedPreferences.getString(AppStrings.ID);
      final emailVerificationStatus =
          sharedPreferences.getString(AppStrings.emailVerificationStatus);
      if (token != null && email != null && uid != null && id != null) {
        UserModel userModel = UserModel(
          email: email,
          uid: uid,
          id: id,
          createdAt: DateTime.fromMillisecondsSinceEpoch(1),
          v: 0,
          phoneVerificationStatus: '',
          updatedAt: DateTime.fromMillisecondsSinceEpoch(1),
          otp: '',
          status: '',
          termsAndConditions: true,
          otpCreatedAt: DateTime.fromMillisecondsSinceEpoch(1),
          newsLetter: false,

          ///TODO:- check
          emailVerificationStatus: emailVerificationStatus ?? '',
          country: UserProfileRespCountryModel.empty(),
          defaultCurrency: '',
          dob: DateTime.fromMicrosecondsSinceEpoch(1),
          firstName: '',
          lastName: '',
          recoveryEmail: '',
          profileImage: '',
        );
        AuthDataModal authDataModal = AuthDataModal(
          token: token,
          user: userModel,
          ip: '',
        );
        return Right(authDataModal);
      } else {
        return const Left(false);
      }
    } else {
      return const Left(false);
    }
  }

  @override
  Future<void> saveUser(AuthDataModal authDataModal) async {
    sharedPreferences.setString("TOKEN", authDataModal.token);
    sharedPreferences.setString("EMAIL", authDataModal.user.email);
    sharedPreferences.setString("UID", authDataModal.user.uid);
    sharedPreferences.setString("ID", authDataModal.user.id);
    sharedPreferences.setString(AppStrings.emailVerificationStatus,
        authDataModal.user.emailVerificationStatus);
  }

  @override
  Future<void> clearUser() async {
    await sharedPreferences.clear();
  }

  @override
  Future<Either<Failure, dynamic>> verifyToken() async {
    try {
      final res = await dio.get('/v1/verify-token');
      if (res.statusCode == 200) {
        return Right(res.data);
      } else if (res.statusCode == 401) {
        return Left(AccountHold(message: res.data['message']));
      } else {
        return Left(ServerFailure(message: 'Unauthorised'));
      }
    } on DioError catch (e) {
      //FirebaseCrashlytics.instance.recordError(e, StackTrace.current);
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: 'Unauthorised'));
    }
  }

  @override
  Future<Either<Failure, dynamic>> updateFcmToken(String token) async {
    return await appApi.apiPatch(endpoint: '/auth/get-device-token', data: {
      'token': token
    }).then((value) => value.fold((l) => Left(l), (r) {
          print(r.data);
          return Right(r.statusCode);
        }));
  }
}

class LoginRequest {
  final String userId;
  final String password;
  final String strategy;

  LoginRequest(
      {required this.userId, required this.password, required this.strategy});
}

const APPLICATION_JSON = 'application/json';
const CONTENT_TYPE = 'content-type';
const ACCEPT = 'accept';
const AUTHORIZATION = 'Authorization';
const DEFAULT_LANGUAGE = 'language';
