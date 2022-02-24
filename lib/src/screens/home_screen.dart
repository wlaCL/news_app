// ignore_for_file: use_key_in_widget_constructors, unnecessary_const

import 'package:appicacion_noticias/src/provider/providers.dart';
import 'package:appicacion_noticias/src/screens/screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ModelTabs(),
      child: Scaffold(
        body: const _Pages(),
        bottomNavigationBar: _NavigationBottom(),
      ),
    );
  }
}

class _NavigationBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final itemSelect = Provider.of<ModelTabs>(context);
    return BottomNavigationBar(
      currentIndex: itemSelect.selectTab,
      onTap: (index) => itemSelect.selectTab = index,
      items: const [
        const BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.person_circle_fill,
            ),
            label: "Para ti"),
        const BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.globe),
          label: "Mundo",
        ),
      ],
    );
  }
}

class _Pages extends StatelessWidget {
  const _Pages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tab = Provider.of<ModelTabs>(context);
    return PageView(
      //physics: const BouncingScrollPhysics(),
      controller: tab.pagesController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Page1Screen(),
        Page2Screen(),
      ],
    );
  }
}
