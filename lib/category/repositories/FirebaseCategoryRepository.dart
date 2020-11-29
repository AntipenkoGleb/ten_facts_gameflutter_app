import 'package:cloud_firestore/cloud_firestore.dart';

import '../category.dart';

class FirestoreCategoryRepository implements CategoryRepository {
  final _categoryCollection = FirebaseFirestore.instance.collection('category');

  @override
  Future<List<Category>> categories() async {
    return _categoryCollection.get().then((snapshot) {
      return snapshot.docs
          .map((doc) => Category.fromEntity(CategoryEntity.fromSnapshot(doc)))
          .toList();
    });
  }
}
