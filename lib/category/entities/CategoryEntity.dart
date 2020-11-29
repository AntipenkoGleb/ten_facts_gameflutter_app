import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final String documentId;
  final String title;
  final String image;

  const CategoryEntity(this.documentId, this.title, this.image);

  @override
  List<Object> get props => [documentId, title, image];

  @override
  String toString() => 'Category: $title';

  static CategoryEntity fromSnapshot(DocumentSnapshot snap) {
    return CategoryEntity(snap.id, snap.data()['title'], snap.data()['image']);
  }
}
