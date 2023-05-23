import 'package:scrap_shop/models/categoryModel.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ListCategoryViewModel {
  List<CategoryViewModel>? list;
  var supabaseClient = Supabase.instance.client;

  Future<void> getCategory() async {
    final json = await supabaseClient.from("category").select().order("id", ascending: true);
    list = (json as List).map((e) => CategoryViewModel(CategoryModel.fromJson(e))).toList();
  }
}

class CategoryViewModel {
  CategoryModel categoryModel;
  CategoryViewModel(this.categoryModel);
}
