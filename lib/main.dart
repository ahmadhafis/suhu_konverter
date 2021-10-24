import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'widgets/convert.dart';
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
  String newValue = "kelvin";

  konversi() {
    setState(() {
      inputUser = double.parse(etInput.text);
      reamur = 4 / 5 * inputUser;
      kelvin = inputUser + 273;
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Result(
                    result: kelvin,
                    title: "Kelvin",
                  ),
                  Result(
                    result: reamur,
                    title: "Reamur",
                  )
                ],
              ),
              Convert(
                konversi: konversi,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
