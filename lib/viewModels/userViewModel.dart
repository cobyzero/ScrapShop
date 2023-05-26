import 'package:flutter/material.dart';
import 'package:scrap_shop/models/userModel.dart';
import 'package:scrap_shop/util/common.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ListUserViewModel {
  List<UserViewModel>? list;
  final supabaseClient = Supabase.instance.client;

  Future<void> signInWithEmail(BuildContext context, String username, String password) async {
    try {
      loading(context);
      await supabaseClient.auth
          .signInWithPassword(
            email: username,
            password: password,
          )
          .whenComplete(() => finish(context));

      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, "main");
    } catch (e) {
      messageDialog(context, "Datos ingresados fueron incorrectos.");
      return;
    }
  }

  Future<void> signUpWithEmail(
      BuildContext context, String email, String name, String password) async {
    try {
      loading(context);

      await supabaseClient.auth.signUp(email: email, data: {"name": name}, password: password);

      await supabaseClient.from("user").insert({
        "name": name,
        "username": email,
        "email": email,
        "password": password,
      });

      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, "main");
    } catch (e) {
      messageDialog(context, "Datos ingresados fueron invalidos");
      return;
    }
  }

  Future<void> logOut(BuildContext context) async {
    await supabaseClient.auth.signOut();

    // ignore: use_build_context_synchronously
    Navigator.pushNamed(context, "login");
  }
}

class UserViewModel {
  UserModel userModel;
  UserViewModel(this.userModel);
}
