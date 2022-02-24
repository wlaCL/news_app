import 'package:appicacion_noticias/src/models/models.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

final String _url_base = 'newsapi.org';
final String _api_key = 'a55f3e4cae5d42ea9d31e8fafcb1a4e5';
final String _path_url = '/v2/top-headlines';
final Map<String, dynamic> categoriesPermit = {
  'Negocios': 'business',
  'Entretenimiento': 'entertainment',
  'General': 'general',
  'Salud': 'health',
  'Ciencia': 'science',
  'Deporte': 'sports',
  'Tecnología': 'technology'
};

class NewService with ChangeNotifier {
  List<Article> articulos = [];
  List<Category> categories = [
    const Category(icon: FontAwesomeIcons.building, name: 'Negocios'),
    const Category(icon: FontAwesomeIcons.tv, name: 'Entretenimiento'),
    const Category(icon: FontAwesomeIcons.addressCard, name: 'General'),
    const Category(icon: FontAwesomeIcons.headSideVirus, name: 'Salud'),
    const Category(icon: FontAwesomeIcons.vials, name: 'Ciencia'),
    const Category(icon: FontAwesomeIcons.volleyballBall, name: 'Deporte'),
    const Category(icon: FontAwesomeIcons.memory, name: 'Tecnología')
  ];

  Map<String, dynamic> mapCategories = {};
  String _selectedCategory = 'Negocios';
  bool isLoading = true;

  String get selectedCategory => _selectedCategory;

  List<Article> get getSelectedList => mapCategories[selectedCategory];
  set selectedCategory(String valor) {
    _selectedCategory = valor;
    getNewsCategory(valor);
  }

  NewService() {
    getHeadlines();
    categories.forEach((element) {
      mapCategories[element.name] = <Article>[];
    });
    getNewsCategory(_selectedCategory);
  }

  // obtencion de noticias de titulares para tab1
  getHeadlines() async {
    try {
      final Map<String, String> query = {'country': 'co', 'apiKey': _api_key};
      final url = Uri.https(_url_base, '${_path_url}', query);
      final response = await http.get(url);
      final response_news = NewResponse.fromJson(response.body);
      articulos.addAll(response_news.articles!);
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  getNewsCategory(String category) async {
    if (mapCategories[category].length > 0) {
      isLoading = false;
      notifyListeners();
      return;
    }
    try {
      final Map<String, String> query = {
        'country': 'co',
        'apiKey': _api_key,
        'category': categoriesPermit[category]
      };
      final url = Uri.https(_url_base, '${_path_url}', query);
      final response = await http.get(url);
      final response_news = NewResponse.fromJson(response.body);
      mapCategories[category].addAll(response_news.articles);

      isLoading = false;
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}
