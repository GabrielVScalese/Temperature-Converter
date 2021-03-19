import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_controller.dart';
import 'models/input_controller.dart';
import 'models/result_controller.dart';
import 'models/temperature_converter.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  List<String> temperatureCategories = ['Celsius', 'Kelvin', 'Fahrenheit'];

  String inputCategory = 'Kelvin';
  String resultCategory = 'Kelvin';
  String inputValue = '';
  String result = '';

  var txt = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              UserAccountsDrawerHeader(),
              ListTile(
                leading: Icon(Icons.color_lens),
                title: Text('Trocar tema'),
                subtitle: Text('Tema escuro ou tema claro'),
                onTap: () {
                  AppController.instance.changeTheme();
                },
              ),
              ListTile(
                leading: Icon(Icons.thermostat_outlined),
                title: Text('Escalas e conversões'),
                subtitle: Text('Saiba mais sobre'),
                onTap: () {
                  Navigator.of(context).pushNamed('/informations');
                },
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text('Sobre'),
                subtitle: Text('Autoria e objetivos'),
                onTap: () {
                  Navigator.of(context).pushNamed('/author');
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text('Conversor de Temperatura'),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(height: 87.0),
                Container(
                    child: Icon(
                  Icons.thermostat_outlined,
                  size: 140.0,
                )),
                Container(
                  height: 20,
                ),
                Container(
                  width: 300,
                  child: DropdownButton<String>(
                    value: inputCategory,
                    isExpanded: true,
                    items: temperatureCategories
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          textAlign: TextAlign.center,
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        inputCategory = value;
                        InputController.instance.changeResultText(
                            '(De) Temperatura em $inputCategory');
                        txt.text = '';
                      });
                    },
                  ),
                ),
                Container(
                  height: 20,
                ),
                Container(
                  width: 300,
                  child: TextField(
                    onChanged: (text) {
                      inputValue = text;
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: InputController.instance.result,
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(height: 10),
                Container(
                  width: 300,
                  child: DropdownButton<String>(
                    value: resultCategory,
                    isExpanded: true,
                    items: temperatureCategories
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          textAlign: TextAlign.center,
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        resultCategory = value;
                        ResultController.instance.changeResultText(
                            '(Para) Temperatura em $resultCategory');
                        txt.text = '';
                      });
                    },
                  ),
                ),
                Container(
                  height: 20,
                ),
                Container(
                  width: 300,
                  child: TextField(
                    enabled: false,
                    controller: txt,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: ResultController.instance.result,
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  height: 40,
                ),
                RaisedButton(
                    child: Container(
                      width: 200,
                      child: Text(
                        'Converter',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    onPressed: () {
                      if (isReal(inputValue)) {
                        switch (inputCategory) {
                          case 'Celsius':
                            if (resultCategory == 'Kelvin')
                              result = TemperatureConverter.celsiusToKelvin(
                                      double.parse(inputValue))
                                  .toString();
                            else if (resultCategory == 'Fahrenheit')
                              result = TemperatureConverter.celsiusToFahrenheit(
                                      double.parse(inputValue))
                                  .toString();
                            else
                              result = inputValue;
                            break;

                          case 'Kelvin':
                            if (resultCategory == 'Celsius')
                              result = TemperatureConverter.kelvinToCelsius(
                                      double.parse(inputValue))
                                  .toString();
                            else if (resultCategory == 'Fahrenheit')
                              result = TemperatureConverter.kelvinToFahrenheint(
                                      double.parse(inputValue))
                                  .toString();
                            else
                              result = inputValue;
                            break;

                          case 'Fahrenheit':
                            if (resultCategory == 'Celsius')
                              result = TemperatureConverter.fahrenheitToCelsius(
                                      double.parse(inputValue))
                                  .toString();
                            else if (resultCategory == 'Kelvin')
                              result = TemperatureConverter.fahrenheitToKelvin(
                                      double.parse(inputValue))
                                  .toString();
                            else
                              result = inputValue;
                        }

                        txt.text = result;
                      } else {
                        showAlertDialog(context);
                      }
                    })
              ],
            ),
          ),
        ));
  }

  isReal(String value) {
    try {
      double num = double.parse(value);
      return true;
    } catch (Exception) {
      return false;
    }
  }

  showAlertDialog(BuildContext context) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Valor inválido"),
      content: Text("Digite um valor numérico"),
      actions: [
        // okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
