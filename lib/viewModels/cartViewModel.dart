import 'package:scrap_shop/models/cartModel.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ListCartViewModel {
  List<CartViewModel>? list;
  var supabaseClient = Supabase.instance.client;

  Future<void> getCart() async {
    final userId = await supabaseClient
        .from("user")
        .select("id")
        .eq("email", Supabase.instance.client.auth.currentUser!.email)
        .limit(1);

    final json = await supabaseClient.from("cart").select().eq("userId", userId[0]["id"]);

    list = (json as List).map((e) => CartViewModel(CartModel.fromJson(e))).toList();
  }

  Future<void> setCart(int productId, String size, double price) async {
    final userId = await supabaseClient
        .from("user")
        .select("id")
        .eq("email", Supabase.instance.client.auth.currentUser!.email)
        .limit(1);
    await supabaseClient
        .from("cart")
        .insert({"productId": productId, "size": size, "price": price, "userId": userId[0]["id"]});
  }

  Future<void> deleteCart(int id) async {
    await supabaseClient.from("cart").delete().eq("id", id);
  }
}

class CartViewModel {
  CartModel cartModel;

  CartViewModel(this.cartModel);
}
