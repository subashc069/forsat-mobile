import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:forsat/application/classes/errors/common_error.dart';
import 'package:forsat/application/forsat_api.dart';
import 'package:forsat/application/storage/local_storage.dart';
import 'package:forsat/application/storage/storage_key.dart';

abstract class AuthRepository {
  Future signIn({
    @required String email,
    @required String password,
  });
  Future signUp(
      {@required String firstName,
      @required String lastName,
      @required String address,
      @required String phoneNumber,
      @required String schoolName,
      @required String parentName,
      @required String parentPhoneNumber,
      @required int programId,
      @required int courseId,
      @required String email,
      @required String password,
      @required String passwordConfirmation,
      String profilePicture});
  Future signOut();
}

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future signIn({String email, String password}) async {
    try {
      Response response = await ForsatApi.dio.post("/api/auth/login",
          data: {"email": email, "password": password});
      String accessToken = response.data["accessToken"];
      String expiresAt = response.data["expires_at"];
      print(accessToken);
      print(expiresAt);
      await LocalStorage.setItem(TOKEN, accessToken);
      await LocalStorage.setItem(TOKEN_EXPIRATION, expiresAt);
      return;
    } on DioError catch (e) {
      showNetworkError(e);
    }
  }

  @override
  Future signUp(
      {String firstName,
      String lastName,
      String address,
      String phoneNumber,
      String schoolName,
      String parentName,
      String parentPhoneNumber,
      int programId,
      int courseId,
      String email,
      String password,
      String passwordConfirmation,
      String profilePicture}) async {
    try {
      var response = await ForsatApi.dio.post("/api/auth/register", data: {
        "firstName": firstName,
        "lastName": lastName,
        "address": address,
        "phoneNumber": phoneNumber,
        "schoolName": schoolName,
        "parentName": parentName,
        "parentPhoneNumber": parentPhoneNumber,
        "programId": programId,
        "courseId": courseId,
        "email": email,
        "password": password,
        "password_confirmation": passwordConfirmation,
        "profilePicture": profilePicture,
      });
      print(response);
    } on DioError catch (e) {
      showNetworkError(e);
    }
  }

  @override
  Future signOut() async {
    try {
      Response response = await ForsatApi.dio.get("/api/auth/logout",
          options: Options(headers: {
            'Authorization': "Bearer ${LocalStorage.getItem(TOKEN)}"
          }));
      print(response);
      return;
    } on DioError catch (e) {
      showNetworkError(e);
    }
  }
}
