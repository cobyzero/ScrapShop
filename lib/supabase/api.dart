import 'package:supabase_flutter/supabase_flutter.dart';

class API {
  static Future<User?> signWithEmail(SupabaseClient supabase, String email, String password) async {
    final AuthResponse res = await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
    // final Session? session = res.session;
    // final User? user = res.user;
    return res.user;
  }
}
