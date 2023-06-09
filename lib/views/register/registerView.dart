import 'package:flutter/material.dart';
import 'package:scrap_shop/util/common.dart';
import 'package:scrap_shop/viewModels/userViewModel.dart';
import 'package:scrap_shop/views/widgets/elevatedButton.dart';
import 'package:scrap_shop/views/widgets/textFormField.dart';

// ignore: must_be_immutable
class RegisterView extends StatelessWidget {
  RegisterView({super.key});

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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Create an account",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ),
                      ),
                      Text("Let's create your account",
                          style: TextStyle(fontSize: 20, color: Colors.grey)),
                    ],
                  ),
                  space(h: 50),
                  MyTextFormField(
                    controller: name,
                    title: "Full name",
                    text: "Enter your full name",
                  ),
                  space(h: 20),
                  MyTextFormField(
                    controller: email,
                    title: "Email",
                    text: "Enter your email address",
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
                    text: "Sign Up",
                    icon: Icons.arrow_forward,
                    fun: () {
                      listUserViewModel.signUpWithEmail(
                          context, email.text, name.text, password.text);
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
                      const Text("Already a member?"),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "login");
                          },
                          child: const Text("Log in"))
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

  var name = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  var listUserViewModel = ListUserViewModel();
}
