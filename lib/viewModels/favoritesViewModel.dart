import 'package:scrap_shop/models/favoritesModel.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ListFavoritesViewModel {
  List<FavoritesViewModel>? list;
  final supabaseClient = Supabase.instance.client;
  Future<void> getFavorites() async {
    final userId = await supabaseClient
        .from("user")
        .select("id")
        .eq("email", Supabase.instance.client.auth.currentUser!.email)
        .limit(1);

    final json = await supabaseClient.from("favorites").select().eq("userId", userId[0]["id"]);

    list = (json as List).map((e) => FavoritesViewModel(FavoritesModel.fromJson(e))).toList();
  }

  Future<void> deleteFavorite(int id) async {
    await supabaseClient.from("favorites").delete().eq("id", id);
  }

  Future<void> getFavoriteForId(int productId) async {
    final userId = await supabaseClient
        .from("user")
        .select("id")
        .eq("email", Supabase.instance.client.auth.currentUser!.email)
        .limit(1);
    final json = await supabaseClient
        .from("favorites")
        .select()
        .eq("productId", productId)
        .eq("userId", userId[0]["id"]);

    list = (json as List).map((e) => FavoritesViewModel(FavoritesModel.fromJson(e))).toList();
  }

  Future<void> setFavorite(int productId) async {
    final userId = await supabaseClient
        .from("user")
        .select("id")
        .eq("email", Supabase.instance.client.auth.currentUser!.email)
        .limit(1);

    await supabaseClient
        .from("favorites")
        .insert({"productId": productId, "userId": userId[0]["id"]});
  }
}

class FavoritesViewModel {
  FavoritesModel favoritesModel;

  FavoritesViewModel(this.favoritesModel);
}
