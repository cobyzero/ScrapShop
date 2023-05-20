import 'package:flutter/material.dart';
import 'package:scrap_shop/util/const.dart';
import 'package:scrap_shop/views/routes.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(url: SUPABASE_URL, anonKey: SUPABASE_ANON_KEY);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      routes: routesApp(),
      initialRoute: "splash",
      theme: ThemeData(fontFamily: "GeneralSans"),
    );
  }
}
