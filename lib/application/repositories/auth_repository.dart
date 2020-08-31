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
      @required String email,
      @required String password,
      @required String passwordConfirmation});
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
      String email,
      String password,
      String passwordConfirmation}) async {
    try {
      var response = await ForsatApi.dio.post("/api/auth/register", data: {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
        "password_confirmation": passwordConfirmation,
      });
      print(response);
    } on DioError catch (e) {
      showNetworkError(e);
    }
  }
}
