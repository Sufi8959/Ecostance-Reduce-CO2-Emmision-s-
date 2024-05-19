import 'dart:io';
import 'dart:convert';
import 'dart:developer' as devLog;
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:hive/hive.dart';
import 'package:net_carbons/app/constants/a2_a3.dart';
import 'package:net_carbons/app/constants/string_constants.dart';
import 'package:net_carbons/data/core/general/failiure.dart';
import 'package:net_carbons/data/core/mapper/mapper.dart';
import 'package:net_carbons/data/core/network/app_api.dart';
import 'package:net_carbons/data/core/network/dio.dart';
import 'package:net_carbons/data/user_profile/calculator_result_hive/hive_modal.dart';
import 'package:net_carbons/data/user_profile/dashboard_metrics_response/dashboard_metrics_response.dart';
import 'package:net_carbons/data/user_profile/get_certificate_response/get_certificate_response.dart';
import 'package:net_carbons/data/user_profile/order_fetch_response/order_fetch_response.dart';
import 'package:net_carbons/data/user_profile/response/profile_response.dart';
import 'package:net_carbons/data/user_profile/save_calculations_payload/save_calculations_payload.dart';
import 'package:net_carbons/domain/user_profile/modal/certificate_details.dart';
import 'package:net_carbons/domain/user_profile/modal/get_review_by_orderId_productId_modal.dart';
import 'package:net_carbons/domain/user_profile/modal/metrics_modal.dart';
import 'package:net_carbons/domain/user_profile/modal/profile_modal.dart';
import 'package:net_carbons/domain/user_profile/repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/user_profile/modal/my_orders_list.dart';
import '../get_review_by_order_product_ids_response/get_review_by_order_product_ids_response.dart';
import 'package:intl_phone_field/phone_number.dart';

class UserProfileRepository implements IUserProfileRepository {
  UserProfileRepository(
      {required this.sharedPreferences,
      required this.dio,
      required this.appApi});

  final SharedPreferences sharedPreferences;

  final DioManager dio;

  final AppApi appApi;

  @override
  Future<Either<Failure, UserProfileModal>> getUserProfile() async {
    return await appApi
        .apiGet(endpoint: '/v1/me')
        .then((value) => value.fold((l) {
              return Left(l);
            }, (r) {
              return Right(UserProfileResponse.fromJson(r.data).toDomain());
            }));

    // try {
    //   final resp = await dio.get('/v1/me');
    //
    //   if (resp.statusCode == 200) {
    //     final response = UserProfileResponse.fromJson(resp.data);
    //
    //     return Right(response.toDomain());
    //   } else if (resp.statusCode == 401) {
    //     return Left(UnAuthorizedFailure(resp.statusMessage ?? ''));
    //   } else {
    //     return Left(ServerFailure(message: resp.data['message'])
    //         .orGeneric("Something went wrong. Please try again later."));
    //   }
    // } catch (e) {
    //   return Left(ClientFailure(message: e.toString())
    //       .orGeneric("Something went wrong. Please try again later."));
    // }
  }

  @override
  Future<Either<Failure, MyOrdersListModal>> getOrderList(
      String currency, int page) async {
    try {
      final resp = await dio.get('/v1/customer-orders',
          queryParameters: {'cert': true, 'size': 3, 'page': page});
//6584
      if (resp.statusCode == 200) {
        final response = OrderFetchResponse.fromJson(resp.data);
        final respp = response.toDomain(currency);

        return Right(respp);
      } else if (resp.statusCode == 401) {
        return Left(AccountHold(message: resp.data['message']));
      } else {
        return Left(ServerFailure(message: resp.data['message'])
            .orGeneric("Something went wrong. Please try again later."));
      }
    } on DioError catch (e) {
      print(e);
      if (e.response?.statusCode == 401) {
        return Left(AccountHold(message: e.response?.data['message']));
      }
      return Left(
          ClientFailure(message: e.response?.data['message'] ?? "Unknown Error")
              .orGeneric("Something went wrong. Please try again later."));
    } catch (e) {
      print(e);
      return Left(ClientFailure(message: e.toString())
          .orGeneric("Something went wrong. Please try again later."));
    }
  }

  @override
  Future<Either<Failure, BillingAddressModal>> createOrUpdateAddress(
      BillingAddressModal billingAddressResponse,
      PhoneNumber? phoneNumber) async {
    final billiAddress = billingAddressResponse.toDataLayer();
    final dataMap = {
      "firstName": billiAddress.firstName ?? '',
      "lastName": billiAddress.lastName ?? '',
      "contactNo": billiAddress.contactNo?.toJson() ?? '',
      "addressLine1": billiAddress.addressLine1 ?? '',
      "addressLine2": billiAddress.addressLine2 ?? '',
      "city": billiAddress.city ?? '',
      "state": billiAddress.state ?? '',
      "country": billiAddress.country ?? '',
      "pincode": billiAddress.pincode ?? '',
      "stateCode": billiAddress.stateCode ?? '',
      "countryCode": billiAddress.countryCode ?? '',
    };
    if (phoneNumber != null) {
      dataMap.addAll({
        'number': phoneNumber.number,
        'numericCode': phoneNumber.countryCode,
        'countryCode': phoneNumber.countryISOCode.length == 3
            ? phoneNumber.countryISOCode
            : countryCodesConvertA2ToA3(a2Code: phoneNumber.countryISOCode) ??
                'USA',
      });
    }
    try {
      final resp = await dio.patch(
        '/v1/addresses',
        data: dataMap,
      );

      if (resp.statusCode == 200) {
        final response = BillingAddressResponse.fromJson(resp.data);

        return Right(response.toDomain());
      } else if (resp.statusCode == 401) {
        return Left(AccountHold(message: resp.data['message']));
      } else {
        return Left(ServerFailure(message: resp.data['message'])
            .orGeneric("Something went wrong. Please try again later."));
      }
    } on DioError catch (e) {
      FirebaseCrashlytics.instance.recordError(e, StackTrace.current);
      return Left(ClientFailure(message: e.toString())
          .orGeneric("Something went wrong. Please try again later."));
    } catch (e) {
      return Left(ClientFailure(message: e.toString())
          .orGeneric("Something went wrong. Please try again later."));
    }
  }

  @override
  Future<Either<Failure, DashboardMetricsModal>> getMetricsData() async {
    final res = await appApi.apiGet(endpoint: '/v1/metrics');

    return res.fold((l) => Left(l), (r) {
      final data = r.data;
      return Right(DashboardMetricsResponse.fromJson(data).toDomain());
    });
  }

  @override
  Future<Either<Failure, CertificateDetailsModal>> getCertificateDetails(
      String certificateId) async {
    final res = await appApi.apiGet(
        endpoint: '/v1/user-certificates/$certificateId/details');
    return res.fold((l) => Left(l), (r) {
      return Right(GetCertificateResponse.fromJson(r.data).toDomain());
    });
  }

  @override
  Future<Either<Failure, dynamic>> postAReview(
      {required double ratingCount,
      required String comment,
      required String productId,
      required String orderId}) async {
    try {
      final resp = await dio.post('/v1/review', data: {
        "product": productId,
        "order": orderId,
        "rating": ratingCount,
        "comment": comment
      });

      if (resp.statusCode == 200 || resp.statusCode == 201) {
        return Right(resp);
      } else if (resp.statusCode == 403) {
        return Left(UnAuthorizedFailure(resp.statusMessage));
      } else if (resp.statusCode == 401) {
        return Left(AccountHold(message: resp.data['message']));
      } else {
        return Left(ServerFailure(message: "Server Error"));
      }
    } on SocketException catch (e) {
      return Left(ClientFailure(message: 'Internet connection failed')
          .orGeneric("Internet connection failed"));
    } on DioError catch (e) {
      FirebaseCrashlytics.instance
          .recordError(e.response?.data, StackTrace.current, information: [
        {'code': e.response?.statusCode}
      ]);
      return Left(
          ClientFailure(message: e.response?.data['message'] ?? 'Unknown error')
              .orGeneric("Something went wrong. Please try again later."));
    } catch (e) {
      return Left(ServerFailure(message: 'Server error')
          .orGeneric("Something went wrong. Please try again later."));
    }
  }

  @override
  Future<Either<Failure, GetReviewByOrderProductIdsModal>>
      getReviewByOrderIdProductId(
          {required String orderId, required String productId}) async {
    final res = await appApi.apiGet(endpoint: '/v1/review/$orderId/$productId');
    return res.fold((l) => Left(ClientFailure(message: l.message)), (r) {
      return Right(
          GetReviewByOrderProductIdsResponse.fromJson(r.data).toDomain());
    });
  }

  @override
  Future<Either<Failure, dynamic>> updateReview(
      {required double ratingCount,
      required String comment,
      required String reviewId}) async {
    final res = await appApi.apiPatch(
        endpoint: '/v1/review/$reviewId',
        data: {"rating": ratingCount, "comment": comment});
    return res.fold((l) => Left(ClientFailure(message: l.message)), (r) {
      return Right(r.data);
    });
  }

  @override
  Future<Either<Failure, dynamic>> cancelASubscription(String id) async {
    try {
      final resp = await dio.delete('/v1/cancel-subscription/$id');
      print('===========$resp');
      if (resp.statusCode == 200) {
        return Right(resp);
      } else if (resp.statusCode == 401) {
        return Left(AccountHold(message: resp.data['message']));
      } else {
        return Left(ServerFailure(message: "Server Error"));
      }
    } on SocketException catch (e) {
      return Left(ClientFailure(message: 'Internet connection failed')
          .orGeneric("Internet connection failed"));
    } on DioError catch (e) {
      FirebaseCrashlytics.instance.recordError(e, StackTrace.current);
      return Left(
          ClientFailure(message: e.response?.data['error'] ?? 'Unknown error')
              .orGeneric("Something went wrong. Please try again later."));
    } catch (e) {
      return Left(ServerFailure(message: 'Server error')
          .orGeneric("Something went wrong. Please try again later."));
    }
  }

  @override
  Future<Either<Failure, dynamic>> saveProfile(
      Map<String, dynamic> data) async {
    FormData formData = FormData.fromMap(data);

    try {
      final resp = await dio.patch('/v1/save-profile-info', formData: formData);

      if (resp.statusCode == 200 || resp.statusCode == 201) {
        return Right(resp);
      } else if (resp.statusCode == 401) {
        return Left(AccountHold(message: resp.data['message']));
      } else if (resp.statusCode == 403) {
        return Left(UnAuthorizedFailure(resp.statusMessage));
      } else {
        return Left(ServerFailure(message: "Server Error"));
      }
    } on SocketException catch (e) {
      return Left(ClientFailure(message: 'Internet connection failed')
          .orGeneric("Internet connection failed"));
    } on DioError catch (e) {
      FirebaseCrashlytics.instance.recordError(e, StackTrace.current);
      print(e);
      return Left(ClientFailure(message: 'Unknown error')
          .orGeneric("Something went wrong. Please try again later."));
    } catch (e) {
      return Left(ServerFailure(message: 'Server error')
          .orGeneric("Something went wrong. Please try again later."));
    }
  }

  @override
  Future<Either<Failure, dynamic>> saveEmission(
      SaveCalculationsPayload saveCalculationsPayload) async {
    try {
      final resp = await dio.patch('/v1/save-carbon-calculations',
          data: saveCalculationsPayload.toJson());
      // {"success":false,"message":"House hold members, Income,
      // House size, Air travel, Meat consumption, Total carbon
      // emissions and Country code are required!"}
      if (resp.statusCode == 200 || resp.statusCode == 201) {
        return Right(resp.data);
      } else if (resp.statusCode == 401) {
        return Left(AccountHold(message: resp.data['message']));
      } else {
        return Left(ServerFailure(message: "Server Error"));
      }
    } on SocketException catch (e) {
      return Left(ClientFailure(message: 'Internet connection failed')
          .orGeneric("Internet connection failed"));
    } on DioError catch (e) {
      FirebaseCrashlytics.instance.recordError(e, StackTrace.current);

      return Left(ClientFailure(
              message: e.response?.data['message'] ?? "Unknown error ")
          .orGeneric("Something went wrong. Please try again later."));
    } catch (e) {
      return Left(ServerFailure(message: 'Server error')
          .orGeneric("Something went wrong. Please try again later."));
    }
  }

  @override
  Future<Either<Failure, dynamic>> subscribeToNewsletter(String email) async {
    return await appApi.apiPost(endpoint: '/v1/mailing-lists', data: {
      "email": email,
      "origin": "mobile"
    }).then((value) => value.fold((l) {
          return Left(l);
        }, (r) {
          return Right(r);
        }));
  }

  @override
  Future<Either<Failure, dynamic>> unSubscribeFromNewsletter(
      String email) async {
    return await appApi
        .apiPatch(endpoint: '/v1/mailing-lists/$email/unsubscribe')
        .then((value) => value.fold((l) {
              return Left(l);
            }, (r) {
              return Right(r);
            }));
  }

  @override
  Future<void> setNotificationEnabledStatusTrueIfNoKey() async {
    final containes = sharedPreferences
        .containsKey(AppStrings.sharedPrefNotificationStatusKey);
    if (containes) {
      return;
    }
    sharedPreferences.setBool(AppStrings.sharedPrefNotificationStatusKey, true);
  }

  @override
  Future<bool?> getNotificationEnabledStatus() async {
    return sharedPreferences
        .getBool(AppStrings.sharedPrefNotificationStatusKey);
  }

  @override
  Future<void> setNotificationEnabledStatus(bool newStatus) {
    return sharedPreferences.setBool(
        AppStrings.sharedPrefNotificationStatusKey, newStatus);
  }

  @override
  Future<Either<Failure, dynamic>> saveEmissionToLocalStorage(
      SaveCalculationsPayload saveCalculationsPayload) async {
    final data = SaveCalculationsHive(
        houseHoldMembers: saveCalculationsPayload.houseHoldMembers,
        publicTransportationMembers:
            saveCalculationsPayload.publicTransportationMembers,
        income: saveCalculationsPayload.income,
        houseSize: saveCalculationsPayload.houseSize,
        airTravel: saveCalculationsPayload.airTravel,
        meatConsumption: saveCalculationsPayload.meatConsumption,
        totalCarbonEmissions: saveCalculationsPayload.totalCarbonEmissions,
        countryCode: saveCalculationsPayload.countryCode);

    final calculateDb =
        await Hive.openBox<SaveCalculationsHive>(AppStrings.calculateResultDb);
    await calculateDb.clear();
    final res = await calculateDb.add(data);
    return Right(res);
  }

  @override
  Future<Either<Failure, SaveCalculationsHive>>
      getEmissionToLocalStorage() async {
    try {
      final db = await Hive.openBox<SaveCalculationsHive>(
          AppStrings.calculateResultDb);
      final data = db.values;
      return Right(data.toList().first);
    } catch (e) {
      return Left(Failure("Can't get data"));
    }
  }

  @override
  Future<Either<Failure, dynamic>> clearLocalStorageEmission() async {
    try {
      final db = await Hive.openBox<SaveCalculationsHive>(
          AppStrings.calculateResultDb);
      db.clear();
      return const Right('Success');
    } catch (e) {
      return Left(Failure("Can't get data"));
    }
  }

  @override
  Future<Either<Failure, dynamic>> updatePrimaryEmail(String email) async {
    return await appApi.apiPatch(endpoint: '/auth/update-primary-email', data: {
      'email': email
    }).then((value) => value.fold((l) {
          return Left(l);
        }, (r) {
          return Right(r);
        }));
  }

  @override
  Future<Either<Failure, dynamic>> verifyPrimaryEmailOtp(String otp) async {
    return await appApi
        .apiPatch(endpoint: '/auth/primary-email-otp-verify', data: {
      'otp': otp
    }).then((value) => value.fold((l) {
              return Left(l);
            }, (r) {
              return Right(r.data['data']);
            }));
  }

  @override
  Future<Either<Failure, dynamic>> verifyPrimaryEmailUsingPassword(
      String password, String token) async {
    try {
      final resp = await dio.patch(
          '/auth/primary-email-password-verify?tk=$token',
          data: {'password': password});

      if (resp.statusCode == 200) {
        return Right(resp.data);
      } else if (resp.statusCode == 401) {
        return Left(AccountHold(message: resp.data['message']));
      } else if (resp.statusCode == 400) {
        if (resp.data['code'] == "PRIMARY_EMAIL_CHANGE_ATTEMPTS_EXCEEDED") {
          return Left(
              PrimaryEmalAtemptsExceeded(message: resp.data['message']));
        }
        return Left(ServerFailure(message: resp.data['message']));
      } else {
        return Left(ServerFailure(message: resp.data['message']));
      }
    } on SocketException catch (e) {
      return Left(ClientFailure(message: 'Internet connection failed')
          .orGeneric("Internet connection failed"));
    } on DioError catch (e) {
      if (e.response?.data['code'] ==
          "PRIMARY_EMAIL_CHANGE_ATTEMPTS_EXCEEDED") {
        return Left(
            PrimaryEmalAtemptsExceeded(message: e.response?.data['message']));
      }
      return Left(ClientFailure(
              message: e.response?.data['message'] ?? "Unknown error ")
          .orGeneric("Something went wrong. Please try again later."));
    } catch (e) {
      return Left(ServerFailure(message: 'Server error')
          .orGeneric("Something went wrong. Please try again later."));
    }
  }

  @override
  Future<Either<Failure, dynamic>> updateRecoveryEmail(String email) async {
    return await appApi
        .apiPatch(endpoint: '/auth/update-recovery-email', data: {
      'email': email
    }).then((value) => value.fold((l) {
              return Left(l);
            }, (r) {
              return Right(r);
            }));
  }

  @override
  Future<Either<Failure, dynamic>> verifyRecoveryEmailOtp(String otp) async {
    return await appApi
        .apiPatch(endpoint: '/auth/recovery-email-otp-verify', data: {
      'otp': otp
    }).then((value) => value.fold((l) {
              return Left(l);
            }, (r) {
              return Right(r);
            }));
  }

  @override
  Future<Either<Failure, Response<dynamic>>> getEmailUpdateAttempts() async {
    return await appApi
        .apiGet(endpoint: '/auth/primary-email-password-failed-attempts')
        .then((value) => value.fold((l) {
              return Left(l);
            }, (r) {
              return Right(r);
            }));
  }
}
