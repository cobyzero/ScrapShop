import 'package:flutter/material.dart';
import 'package:scrap_shop/viewModels/userViewModel.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// ignore: must_be_immutable
class HomeAppBar extends StatelessWidget {
  HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Discover",
                style: TextStyle(fontSize: 32),
              ),
              Text("Hello ${supabaseClient.auth.currentUser!.userMetadata!["name"]}!")
            ],
          ),
        ],
      ),
    );
  }

  var listUserViewModel = ListUserViewModel();
  var supabaseClient = Supabase.instance.client;
}
