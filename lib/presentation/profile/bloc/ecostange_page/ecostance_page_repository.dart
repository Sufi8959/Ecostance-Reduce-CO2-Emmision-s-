import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:net_carbons/data/user_profile/ecostance_page/previous/PreviousResponse.dart';
import '../../../../app/dependency.dart';
import '../../../../data/core/network/dio.dart';
import '../../../../data/user_profile/ecostance_page/my_page/MyPageResponse.dart';
import '../../../../data/user_profile/ecostance_page/slug/MeResponse.dart';

class EcostancePageRepository {
  final dio = getIt<DioManager>();

  Future<MeResponse> fetchMe() async {
    try {
      final response = await dio.get('/v1/me');
      if (response.statusCode == 200) {
        print(">>> API /v1/me");
        print("<<< ${response.data}");
        return MeResponse.fromJson(response.data);
      } else {
        print("Server Error");
      }
    } on SocketException {
      await Future.delayed(const Duration(milliseconds: 1800));
      throw Exception('No Internet Connection');
    } on TimeoutException {
      throw Exception('');
    }
    throw Exception('error fetching data');
  }

  Future<MyPageResponse> fetchMyPage() async {
    try {
      final response = await dio.get('/v1/sustainability-page-settings/');
      if (response.statusCode == 200) {
        print(">>> API /v1/sustainability-page-settings/");
        print("<<< ${response.data}");
        return MyPageResponse.fromJson(response.data);
      } else {
        print("Server Error");
      }
    } on SocketException {
      await Future.delayed(const Duration(milliseconds: 1800));
      throw Exception('No Internet Connection');
    } on TimeoutException {
      throw Exception('');
    }
    throw Exception('error fetching data');
  }

  Future<PreviousResponse> fetchPrevious() async {
    try {
      final response =
          await dio.get('/v1/sustainability-page-settings/previous');
      if (response.statusCode == 200) {
        print(">>> API /v1/sustainability-page-settings/previous");
        print("<<< ${response.data}");
        return PreviousResponse.fromJson(response.data);
      } else {
        print("Server Error");
      }
    } on SocketException {
      await Future.delayed(const Duration(milliseconds: 1800));
      throw Exception('No Internet Connection');
    } on TimeoutException {
      throw Exception('');
    }
    throw Exception('error fetching data');
  }

  Future<void> publishApiCall(Map<String, dynamic> requestData) async {
    try {
      final Map<String, dynamic> data;

      if (requestData['newSlug'] == null) {
        data = {
          'number': requestData['number'],
          'countryCode': requestData['countryCode'],
          'numericCode': requestData['numericCode'],
          'slug': requestData['slug'],
          'name': requestData['name'],
          'showName': requestData['showName'],
          'email': requestData['email'],
          'showEmail': requestData['showEmail'],
          'showPhone': requestData['showPhone'],
          'twitter': requestData['twitter'],
          'showTwitter': requestData['showTwitter'],
          'facebook': requestData['facebook'],
          'showFacebook': requestData['showFacebook'],
          'linkedin': requestData['linkedin'],
          'showLinkedin': requestData['showLinkedin'],
          'instagram': requestData['instagram'],
          'showInstagram': requestData['showInstagram'],
          'country': requestData['country'],
          'aboutUs': requestData['aboutUs'],
          'description': requestData['description'],
          'title': requestData['title'],
          'profilePicURL': requestData['profilePicURL'],
          'isPublic': requestData['isPublic'],
          'themeSelected': requestData['themeSelected'],
        };
      } else {
        data = {
          'number': requestData['number'],
          'countryCode': requestData['countryCode'],
          'numericCode': requestData['numericCode'],
          'newSlug': requestData['newSlug'],
          'slug': requestData['slug'],
          'name': requestData['name'],
          'showName': requestData['showName'],
          'email': requestData['email'],
          'showEmail': requestData['showEmail'],
          'showPhone': requestData['showPhone'],
          'twitter': requestData['twitter'],
          'showTwitter': requestData['showTwitter'],
          'facebook': requestData['facebook'],
          'showFacebook': requestData['showFacebook'],
          'linkedin': requestData['linkedin'],
          'showLinkedin': requestData['showLinkedin'],
          'instagram': requestData['instagram'],
          'showInstagram': requestData['showInstagram'],
          'country': requestData['country'],
          'aboutUs': requestData['aboutUs'],
          'description': requestData['description'],
          'title': requestData['title'],
          'profilePicURL': requestData['profilePicURL'],
          'isPublic': requestData['isPublic'],
          'themeSelected': requestData['themeSelected'],
        };
      }

      print("publish --> $data");

      FormData formData = FormData.fromMap(data);
      final resp = await dio.patch('/v1/sustainability-page-settings/publish',
          formData: formData);

      if (resp.statusCode == 200) {
        print("publish success --> ");
      } else {
        // Handle other status codes
      }
    } on SocketException catch (e) {
      print(e.message.toString());
      if (kDebugMode) {
        print("Internet connection failed");
      }
    } on DioError catch (e) {
      print(e.message.toString());
      if (kDebugMode) {
        print("Something went wrong. Please try again later.");
      }
    } catch (e) {
      if (kDebugMode) {
        print("Server Error, Something went wrong. Please try again later. $e");
      }
    }
  }

  Future<void> defaultApiCall(Map<String, dynamic> requestData) async {
    try {
      final data = {
        'number': requestData['number'],
        'countryCode': requestData['countryCode'],
        'numericCode': requestData['numericCode'],
        'name': requestData['name'],
        'showName': requestData['showName'],
        'email': requestData['email'],
        'showEmail': requestData['showEmail'],
        'showPhone': requestData['showPhone'],
        'twitter': requestData['twitter'],
        'showTwitter': requestData['showTwitter'],
        'facebook': requestData['facebook'],
        'showFacebook': requestData['showFacebook'],
        'linkedin': requestData['linkedin'],
        'showLinkedin': requestData['showLinkedin'],
        'instagram': requestData['instagram'],
        'showInstagram': requestData['showInstagram'],
        'country': requestData['country'],
        'aboutUs': requestData['aboutUs'],
        'description': requestData['description'],
        'title': requestData['title'],
        'profilePicURL': requestData['profilePicURL'],
        'isPublic': requestData['isPublic'],
        'themeSelected': requestData['themeSelected'],
      };

      print("default --> $data");
      FormData formData = FormData.fromMap(data);
      final resp = await dio.patch('/v1/sustainability-page-settings',
          formData: formData);

      if (resp.statusCode == 200) {
        print("default success --> ");
      } else {
        // Handle other status codes
      }
    } on SocketException catch (e) {
      if (kDebugMode) {
        print("Internet connection failed");
      }
    } on DioError catch (e) {
      if (kDebugMode) {
        print("Something went wrong. Please try again later.");
      }
    } catch (e) {
      if (kDebugMode) {
        print("Server Error, Something went wrong. Please try again later. $e");
      }
    }
  }

  Future<void> saveApiCall(Map<String, dynamic> requestData) async {
    try {
      final Map<String, dynamic> data;

      if (requestData['newSlug'] == null) {
        data = {
          'number': requestData['number'],
          'countryCode': requestData['countryCode'],
          'numericCode': requestData['numericCode'],
          'slug': requestData['slug'],
          'name': requestData['name'],
          'showName': requestData['showName'],
          'email': requestData['email'],
          'showEmail': requestData['showEmail'],
          'showPhone': requestData['showPhone'],
          'twitter': requestData['twitter'],
          'showTwitter': requestData['showTwitter'],
          'facebook': requestData['facebook'],
          'showFacebook': requestData['showFacebook'],
          'linkedin': requestData['linkedin'],
          'showLinkedin': requestData['showLinkedin'],
          'instagram': requestData['instagram'],
          'showInstagram': requestData['showInstagram'],
          'country': requestData['country'],
          'aboutUs': requestData['aboutUs'],
          'description': requestData['description'],
          'title': requestData['title'],
          'profilePicURL': requestData['profilePicURL'],
          'isPublic': requestData['isPublic'],
          'themeSelected': requestData['themeSelected'],
        };
      } else {
        data = {
          'number': requestData['number'],
          'countryCode': requestData['countryCode'],
          'numericCode': requestData['numericCode'],
          'newSlug': requestData['newSlug'],
          'slug': requestData['slug'],
          'name': requestData['name'],
          'showName': requestData['showName'],
          'email': requestData['email'],
          'showEmail': requestData['showEmail'],
          'showPhone': requestData['showPhone'],
          'twitter': requestData['twitter'],
          'showTwitter': requestData['showTwitter'],
          'facebook': requestData['facebook'],
          'showFacebook': requestData['showFacebook'],
          'linkedin': requestData['linkedin'],
          'showLinkedin': requestData['showLinkedin'],
          'instagram': requestData['instagram'],
          'showInstagram': requestData['showInstagram'],
          'country': requestData['country'],
          'aboutUs': requestData['aboutUs'],
          'description': requestData['description'],
          'title': requestData['title'],
          'profilePicURL': requestData['profilePicURL'],
          'isPublic': requestData['isPublic'],
          'themeSelected': requestData['themeSelected'],
        };
      }

      print("save --> $data");
      FormData formData = FormData.fromMap(data);
      final resp = await dio.patch('/v1/sustainability-page-settings',
          formData: formData);

      if (resp.statusCode == 200) {
        print("save success --> ");
      } else {
        // Handle other status codes
      }
    } on SocketException catch (e) {
      print(e.message.toString());
      if (kDebugMode) {
        print("Internet connection failed");
      }
    } on DioError catch (e) {
      print(e.message.toString());
      if (kDebugMode) {
        print("Something went wrong. Please try again later.");
      }
    } catch (e) {
      if (kDebugMode) {
        print("Server Error, Something went wrong. Please try again later. $e");
      }
    }
  }
}
