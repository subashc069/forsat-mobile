import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:forsat/application/forsat_api.dart';
import 'package:http/http.dart' as http;

abstract class AuthRepository {
  Future signIn({
    @required String email,
    @required String password,
  });
}

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future signIn({String email, String password}) async {
    // Dio dio = Dio();
    // String url = "http://forsat.merobhakaari.com/api/auth/login";
    print("Signing In");
    // Response response = await dio.post(
    //     "http://forsat.merobhakaari.com/api/auth/login",
    //     data: {"email": email, "password": password});

    // var response =
    //     await http.post(url, body: {'email': email, 'password': password});
    // Response response =
    //     await dio.get("http://www.omdbapi.com/?i=tt3896198&apikey=62ea60e0");
    var response = await ForsatApi.dio
        .post("/api/auth/login", data: {"email": email, "password": password});
    print("Signed In");
    print(response);
  }
}
