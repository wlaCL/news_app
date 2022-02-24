// ignore_for_file: use_key_in_widget_constructors

import 'package:appicacion_noticias/src/screens/screens.dart';
import 'package:appicacion_noticias/src/services/services.dart';
import 'package:appicacion_noticias/src/theme/theme_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewService()),
      ],
      child: MaterialApp(
        theme: themeApp,
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: '/home',
        routes: {
          '/home': (_) => HomeScreen(),
        },
      ),
    );
  }
}
