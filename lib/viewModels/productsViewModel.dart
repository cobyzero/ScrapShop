import 'package:scrap_shop/models/productsModel.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ListProductsViewModel {
  List<ProductsViewModel>? list;
  var supabaseClient = Supabase.instance.client;

  Future<void> getProducts() async {
    final json = await supabaseClient.from("products").select().order("id", ascending: true);
    list = (json as List).map((e) => ProductsViewModel(ProductsModel.fromJson(e))).toList();
  }

  Future<void> getProductsForId(int id) async {
    final json = await supabaseClient.from("products").select().eq("id", id);
    list = (json as List).map((e) => ProductsViewModel(ProductsModel.fromJson(e))).toList();
  }
}

class ProductsViewModel {
  ProductsModel productsModel;

  ProductsViewModel(this.productsModel);
}
