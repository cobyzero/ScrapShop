import 'package:flutter/material.dart';
import 'package:scrap_shop/util/common.dart';
import 'package:scrap_shop/viewModels/userViewModel.dart';
import 'package:scrap_shop/views/widgets/elevatedButton.dart';
import 'package:scrap_shop/views/widgets/textFormField.dart';

// ignore: must_be_immutable
class LoginView extends StatelessWidget {
  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello again!",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ),
                      ),
                      Text("Welcome back you've been missed!",
                          style: TextStyle(fontSize: 20, color: Colors.grey)),
                    ],
                  ),
                  space(h: 50),
                  MyTextFormField(
                    controller: username,
                    title: "Username",
                    text: "Enter your username or email",
                  ),
                  space(h: 20),
                  MyTextFormField(
                    controller: password,
                    title: "Password",
                    text: "Enter your password",
                    oscure: true,
                  ),
                  space(h: 30),
                  MyElevatedButton(
                    text: "Get Started",
                    icon: Icons.arrow_forward,
                    fun: () {
                      userViewModel.signInWithEmail(context, username.text, password.text);
                    },
                  ),
                  Container(
                    width: double.infinity,
                    height: 2,
                    color: Colors.grey.shade300,
                    margin: const EdgeInsets.only(top: 30, bottom: 30),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Not a member?"),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "register");
                          },
                          child: const Text("Register now"))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  var password = TextEditingController();
  var username = TextEditingController();
  var userViewModel = ListUserViewModel();
}
