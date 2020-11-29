part of 'category_page.dart';

Widget categoryList(List<Category> categories, BuildContext ctx) {
  return GridView.count(
    crossAxisCount: 3,
    childAspectRatio: 4 / 5,
    children: categories.map((item) => categoryCard(item, ctx)).toList(),
  );
}

Widget categoryCard(Category category, BuildContext context) {
  final titleStyle = Theme.of(context).textTheme.headline5
    ..merge(GoogleFonts.roboto());
  return Card(
    clipBehavior: Clip.antiAlias,
    child: InkWell(
      onTap: () => print('tapped: ${category.id}'),
      splashColor: Colors.lightBlueAccent,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Text(category.title, style: titleStyle),
          Expanded(child: _loadImage(category))
        ]),
      ),
    ),
  );
}

Widget errorMessage(String text, BuildContext ctx) {
  return Center(child: Text(text, style: Theme.of(ctx).textTheme.headline2));
}

Widget _loadImage(Category category) {
  return FutureBuilder(
    future: FirebaseStorageRepository().getFile(category.image),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return Image.file(snapshot.data);
      } else {
        return Container();
      }
    },
  );
}
