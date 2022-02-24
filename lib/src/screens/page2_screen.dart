import 'package:appicacion_noticias/src/theme/theme_app.dart';
import 'package:appicacion_noticias/src/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:appicacion_noticias/src/models/category_model.dart';
import 'package:appicacion_noticias/src/services/services.dart';

class Page2Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newService = Provider.of<NewService>(context);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Noticias del Mundo"),
          ),
          body: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(height: 120.0, child: _ListCategories()),
                (newService.isLoading)
                    ? Expanded(
                        child: Center(
                            child: CircularProgressIndicator.adaptive(
                                strokeWidth: 5.0,
                                backgroundColor:
                                    themeApp.colorScheme.secondary)))
                    : Expanded(
                        child: NewsList(noticias: newService.getSelectedList))
              ],
            ),
          )),
    );
  }
}

class _ListCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Category> categories =
        Provider.of<NewService>(context).categories;
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return Container(
          width: 115.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                IconDrawer(
                  category: categories[index],
                ),
                Text(categories[index].name),
              ],
            ),
          ),
        );
      },
    );
  }
}

class IconDrawer extends StatelessWidget {
  final Category category;
  IconDrawer({
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final newServiceCategory = Provider.of<NewService>(context);
    return GestureDetector(
      onTap: () {
        final newServiceCategory =
            Provider.of<NewService>(context, listen: false);
        newServiceCategory.selectedCategory = category.name;
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Icon(category.icon,
            color: (newServiceCategory.selectedCategory == category.name)
                ? themeApp.colorScheme.secondary
                : Colors.black45),
      ),
    );
  }
}
