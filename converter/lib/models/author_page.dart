import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthorPage extends StatefulWidget {
  @override
  _AuthorPageState createState() => _AuthorPageState();
}

class _AuthorPageState extends State<AuthorPage> {
  String authorText =
      'Este aplicativo foi desenvolvido por Gabriel Scalese, um estudante do Colégio Técnico de Campinas, do 6º período de Processamento de Dados.\n\nGithub: https://github.com/GabrielVScalese';
  String targetText =
      'Este aplicativo tem o intuito de praticar conhecimentos sobre Flutter e o desenvolvimento mobile.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Autoria e Objetivos'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 60,
            ),
            Container(
              margin: const EdgeInsets.only(left: 13),
              child: Text(
                'Autoria',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
            ),
            Container(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(left: 13, right: 13),
              child: Text(
                authorText,
                style: TextStyle(fontSize: 16),
              ),
            ),
            Container(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.only(left: 13),
              child: Text(
                'Objetivos',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
            ),
            Container(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(left: 13, right: 13),
              child: Text(
                targetText,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
