import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2))
        .whenComplete(() => Navigator.popAndPushNamed(context, "login"));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Image.asset(
                    "assets/splash2.png",
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.9,
                    alignment: Alignment.bottomRight,
                  ),
                  const Positioned(
                    top: 20,
                    left: 20,
                    child: Text(
                      "Define \nyour self in \nyour unique \nway",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 49,
                        fontWeight: FontWeight.bold,
                        height: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}