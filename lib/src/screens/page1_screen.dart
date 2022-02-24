import 'package:appicacion_noticias/src/services/services.dart';
import 'package:appicacion_noticias/src/theme/theme_app.dart';
import 'package:appicacion_noticias/src/widgets/news_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Page1Screen extends StatefulWidget {
  @override
  State<Page1Screen> createState() => _Page1ScreenState();
}

class _Page1ScreenState extends State<Page1Screen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final articulos = Provider.of<NewService>(context).articulos;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Noticias para ti"),
        ),
        body: (articulos.length == 0)
            ? Center(
                child: CircularProgressIndicator.adaptive(
                    strokeWidth: 5.0,
                    backgroundColor: themeApp.colorScheme.secondary),
              )
            : NewsList(noticias: articulos));
  }

  @override
  bool get wantKeepAlive => true;
}
