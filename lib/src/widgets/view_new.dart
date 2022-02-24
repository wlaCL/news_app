import 'package:appicacion_noticias/src/widgets/widget.dart';
import 'package:flutter/material.dart';

import 'package:appicacion_noticias/src/models/article_model.dart';

class ViewNews extends StatelessWidget {
  final Article article;
  const ViewNews({
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Descripción de la noticia"),
        automaticallyImplyLeading: true,
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Fuente: ${article.source!.name}'),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              article.title,
              style: const TextStyle(fontSize: 20.0),
            ),
            CardImage(
              url: '${article.urlToImage}',
            ),
            Text('${article.publishedAt}'),
            Text('${article.content}')
          ],
        ),
      ),
    );
  }
}
