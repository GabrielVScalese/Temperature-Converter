import 'package:converter/converter_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'temperature_converter.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  List<String> temperatureCategories = ['Kelvin', 'Fahrenheit'];

  String temperatureCategory = 'Kelvin';
  String celsius = '';
  String result = '';

  var txt = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 150,
            width: 150,
            child: Image.asset('assets/images/temperature_icon.png'),
          ),
          Container(
            height: 20,
          ),
          Container(
            width: 300,
            child: DropdownButton<String>(
              value: temperatureCategory,
              isExpanded: true,
              items: temperatureCategories
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  temperatureCategory = value;
                  ConverterController.instance
                      .changeResultText('Temperatura em $temperatureCategory');
                  txt.text = '';
                });
              },
            ),
          ),
          Container(
            height: 40,
          ),
          Container(
            width: 300,
            child: TextField(
              onChanged: (text) {
                celsius = text;
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Digite a temperatura em celsius',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            height: 40,
          ),
          Container(
            width: 300,
            child: TextField(
              controller: txt,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: ConverterController.instance.result,
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
                print(temperatureCategory);
                print(celsius);
                if (temperatureCategory == 'Kelvin')
                  result = TemperatureConverter.celsiusToKelvin(
                          double.parse(celsius))
                      .toString();
                else
                  result = TemperatureConverter.celsiusToFahrenheit(
                          double.parse(celsius))
                      .toString();
                txt.text = result;
              })
        ],
      ),
    ));
  }
}
