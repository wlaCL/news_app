import 'package:flutter/material.dart';

import 'package:appicacion_noticias/src/models/article_model.dart';
import 'package:appicacion_noticias/src/widgets/view_new.dart';

class NewsList extends StatelessWidget {
  final List<Article> noticias;
  NewsList({
    required this.noticias,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: noticias.length,
      itemBuilder: (context, index) =>
          _NewCard(articulo: noticias[index], numberNoticie: index),
    );
  }
}

class _NewCard extends StatelessWidget {
  final Article articulo;
  final int numberNoticie;
  const _NewCard({
    required this.articulo,
    required this.numberNoticie,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      child: Column(
        children: [
          _TopBar(
            source: articulo.source!.name,
            numberNoticie: numberNoticie,
          ),
          _NewsHeader(noticie: articulo),
          SizedBox(
            height: 20.0,
          ),
          CardImage(
            url: '${articulo.urlToImage}',
          ),
          CardDescripcion(descripcion: '${articulo.description}'),
          SizedBox(
            height: 20.0,
          ),
          _ReadNew(articulo),
          Divider(color: Colors.white, height: 10),
        ],
      ),
    );
  }
}

class _NewsHeader extends StatelessWidget {
  final Article noticie;
  const _NewsHeader({
    required this.noticie,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(noticie.title, style: TextStyle(fontWeight: FontWeight.w500)),
    );
  }
}

class _TopBar extends StatelessWidget {
  final String source;
  final int numberNoticie;
  const _TopBar({
    required this.source,
    required this.numberNoticie,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          Text('${numberNoticie + 1}. '),
          Text(source),
        ],
      ),
    );
  }
}

class CardImage extends StatelessWidget {
  final String url;
  const CardImage({
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0)),
      child: Container(
        child: (url != null || url == "")
            ? FadeInImage(
                placeholder: AssetImage('assets/img/giphy.gif'),
                image: NetworkImage(url),
                fit: BoxFit.cover,
              )
            : Image(
                image: AssetImage('assets/img/no-image.png'),
              ),
      ),
    );
  }
}

class CardDescripcion extends StatelessWidget {
  final String descripcion;
  const CardDescripcion({
    required this.descripcion,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(descripcion),
    );
  }
}

class _ReadNew extends StatelessWidget {
  final Article articulo;
  const _ReadNew(
    this.articulo,
  );
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ViewNews(article: articulo),
          ),
        );
      },
      child: Container(
        child: Text(
          "Leer nota",
          style: TextStyle(
            color: Colors.deepOrangeAccent,
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
    );
  }
}
