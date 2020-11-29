import 'package:ten_facts_gameflutter_app/category/models/Category.dart';

abstract class CategoryRepository {
  Future<List<Category>> categories();
}
