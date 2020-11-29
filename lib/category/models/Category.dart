import 'package:meta/meta.dart';

import '../category.dart';

@immutable
class Category {
  final String id;
  final String title;
  final String image;

  const Category(this.id, this.title, this.image);

  static Category fromEntity(CategoryEntity entity) {
    return Category(entity.documentId, entity.title, entity.image);
  }
}
