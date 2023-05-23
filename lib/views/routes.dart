import 'package:flutter/material.dart';
import 'package:scrap_shop/views/details/detailsView.dart';
import 'package:scrap_shop/views/main/mainView.dart';
import 'package:scrap_shop/views/login/loginView.dart';
import 'package:scrap_shop/views/register/registerView.dart';
import 'package:scrap_shop/views/splash/splashView.dart';

Map<String, WidgetBuilder> routesApp() {
  return {
    "splash": (context) => const SplashView(),
    "login": (context) => LoginView(),
    "register": (context) => RegisterView(),
    "main": (context) => MainView(),
    "details": (context) => const DetailsView()
  };
}
