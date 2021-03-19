import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InformationsPage extends StatefulWidget {
  @override
  _InformationsPageState createState() => _InformationsPageState();
}

class _InformationsPageState extends State<InformationsPage> {
  String celsiusText =
      'A escala Celsius (unidade °C), também conhecida como a escala centígrada, é uma escala termométrica do sistema métrico usada na maioria dos países do mundo. Teve origem a partir do modelo proposto pelo astrônomo sueco Anders Celsius (1701-1744).';

  String kelvinText =
      'A escala kelvin recebeu este nome em homenagem ao físico e engenheiro irlandês William Thomson (1824–1907), 1º barão Kelvin, que escreveu sobre a necessidade de uma "escala termométrica absoluta".';

  String fahrenheitText =
      'Fahrenheit é uma escala de temperatura proposta por Daniel Gabriel Fahrenheit em 1724. Sua unidade é o grau Fahrenheit (símbolo: °F). Nesta escala, o ponto de fusão da água é de 32 °F e o ponto de ebulição é de 212 °F. Uma diferença de 1,8 °F é igual a uma diferença de 1 °C.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Informações sobre Escalas'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 40,
              ),
              Container(
                margin: const EdgeInsets.only(left: 13),
                child: Text(
                  'Fórmula para conversão',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
              ),
              Container(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(left: 13),
                child: Text(
                  'C / 5 = F - 32 / 9 = K - 273 / 5',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Container(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.only(left: 13, right: 13),
                child: Text(
                  'Celsius',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
              ),
              Container(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(left: 13, right: 13),
                child: Text(
                  celsiusText,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Container(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.only(left: 13, right: 13),
                child: Text(
                  'Kelvin',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
              ),
              Container(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(left: 13, right: 13),
                child: Text(
                  kelvinText,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Container(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.only(left: 13, right: 13),
                child: Text(
                  'Fahrenheit',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
              ),
              Container(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(left: 13, right: 13),
                child: Text(
                  fahrenheitText,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
