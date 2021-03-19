import 'package:converter/app_controller.dart';
import 'package:converter/home_page.dart';
import 'package:converter/informations_page.dart';
import 'package:converter/models/author_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: AppController.instance,
        builder: (BuildContext context, Widget chikld) {
          return MaterialApp(
            theme: ThemeData(
                brightness: AppController.instance.isDarkTheme
                    ? Brightness.dark
                    : Brightness.light),
            debugShowCheckedModeBanner: false,
            home: HomePage(),
            routes: {
              '/informations': (context) => InformationsPage(),
              '/author': (context) => AuthorPage()
            },
          );
        });
  }
}
