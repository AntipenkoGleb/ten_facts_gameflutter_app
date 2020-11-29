import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ten_facts_gameflutter_app/category/models/Category.dart';
import 'package:ten_facts_gameflutter_app/category/repositories/FirebaseCategoryRepository.dart';

part 'category_event.dart';

part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc(this._categoryRepository) : super(CategoryInitial());

  final FirestoreCategoryRepository _categoryRepository;

  @override
  Stream<CategoryState> mapEventToState(
    CategoryEvent event,
  ) async* {
    if (event is LoadRequested) {
      yield* _mapAppStartedToState();
    }
  }

  Stream<CategoryState> _mapAppStartedToState() async* {
    yield CategoryLoad();
    try {
      final List<Category> categories = await _categoryRepository.categories();
      yield CategoryLoaded(categories);
    } catch (e) {
      yield CategoryError(e.toString());
    }
  }
}
