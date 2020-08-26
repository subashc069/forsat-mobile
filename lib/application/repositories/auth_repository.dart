import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class AuthRepository {
  Future signIn({
    @required String email,
    @required String password,
  });
}

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future signIn({String email, String password}) async {
    Dio dio = Dio();
    print("Signing In");
    Response response = await dio.post(
        "http://www.forsat.merobhakaari.com/api/auth/login",
        data: {"email": email, "password": password});
    // Response response =
    //     await dio.get("http://www.omdbapi.com/?i=tt3896198&apikey=62ea60e0");
    print("Signed In");
    print(response);
  }
}
