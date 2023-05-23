import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrap_shop/providers/homeProvider.dart';
import 'package:scrap_shop/views/routes.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        routes: routesApp(),
        initialRoute: "splash",
        theme: ThemeData(fontFamily: "GeneralSans"),
      ),
    );
  }
}
