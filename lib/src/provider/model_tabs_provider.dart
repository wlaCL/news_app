// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';

class ModelTabs with ChangeNotifier {
  int _selectTab = 0;
  final PageController _pagesController = PageController();
  int get selectTab => _selectTab;
  set selectTab(int value) {
    _selectTab = value;
    _pagesController.animateToPage(value,
        duration: const Duration(milliseconds: 250), curve: Curves.easeInOut);
    notifyListeners();
  }

  PageController get pagesController => _pagesController;
}
