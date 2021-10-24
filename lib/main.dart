import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'widgets/convert.dart';
import 'widgets/history.dart';
import 'widgets/input.dart';
import 'widgets/result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController etInput = new TextEditingController();

  double inputUser = 0;
  double kelvin = 0;
  double reamur = 0;
  double result = 0;
  String newValue = "kelvin";

  List<String> listViewItem = [];

  konversi() {
    setState(() {
      inputUser = double.parse(etInput.text);

      if (newValue == "kelvin") {
        result = inputUser + 273;
        listViewItem.add("kelvin: $result");
      } else {
        result = inputUser * (4 / 5);
        listViewItem.add("reamur: $result");
      }
    });
  }

  _dropdownOnChanged(String value) {
    setState(() {
      newValue = value;
    });
  }

  var listItem = ["kelvin", "reamur"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Konverter Suhu"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Input(etInput: etInput),
              //membuat dropdown
              DropdownButton(
                items: listItem.map((String value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                value: newValue,
                onChanged: _dropdownOnChanged,
                isExpanded: true,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Result(
                    result: result,
                  ),
                ],
              ),
              Convert(
                konversi: konversi,
              ),
              Container(
                margin: EdgeInsets.only(top:16,bottom: 18),
                child: Text(
                  "Riwayat Konversi",
                  style: TextStyle(fontSize: 24),
                ),
              ),
              History(listViewItem: listViewItem)
            ],
          ),
        ),
      ),
    );
  }
}
