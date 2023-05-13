import 'package:flutter/material.dart';
import 'package:scrap_shop/views/home/homeView.dart';
import 'package:scrap_shop/views/home/main/mainView.dart';
import 'package:scrap_shop/views/login/loginView.dart';
import 'package:scrap_shop/views/register/registerView.dart';
import 'package:scrap_shop/views/splash/splashView.dart';

Map<String, WidgetBuilder> routesApp() {
  return {
    "splash": (context) => const SplashView(),
    "login": (context) => const LoginView(),
    "register": (context) => const RegisterView(),
    "main": (context) => MainView()
  };
}
