import 'package:flutter/material.dart';
import 'package:forsat/presentation/auth/sign_in_page.dart';
import 'package:forsat/presentation/auth/sign_up_page.dart';
import 'package:forsat/presentation/home/home_page.dart';
import 'package:forsat/presentation/not_found/not_found_page.dart';
import 'package:forsat/presentation/opportunities/opportunities_page.dart';
import 'package:forsat/router/route_constants.dart';

class Router {
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case opportunitiesRoute:
        return MaterialPageRoute(builder: (_) => OpportunitiesPage());
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
      case signInRoute:
        return MaterialPageRoute(builder: (_) => SignInPage());
      case signUpRoute:
        return MaterialPageRoute(builder: (_) => SignUpPage());
      default:
        return MaterialPageRoute(builder: (_) => NotFoundPage());
    }
  }
}
