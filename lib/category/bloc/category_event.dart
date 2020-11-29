part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();
}

class LoadRequested extends CategoryEvent {
  @override
  List<Object> get props => [];
}
