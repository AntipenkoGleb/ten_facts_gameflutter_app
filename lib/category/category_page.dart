import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ten_facts_gameflutter_app/firebase/FirebaseStorageRepository.dart';

import 'category.dart';

part 'widgets.dart';

class CategoryListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Categories')),
        body: _buildCategoryList(context));
  }

  Widget _buildCategoryList(BuildContext context) {
    return BlocProvider(
      create: (ctx) =>
          CategoryBloc(FirestoreCategoryRepository())..add(LoadRequested()),
      child: BlocBuilder<CategoryBloc, CategoryState>(builder: (ctx, state) {
        if (state is CategoryLoaded) {
          return categoryList(state.categories, ctx);
        } else if (state is CategoryError) {
          return errorMessage(state.message, ctx);
        } else
          return Center(child: CircularProgressIndicator());
      }),
    );
  }
}
