import 'package:flutter/material.dart';

class Convert extends StatelessWidget {
  const Convert({
    Key key,
    @required this.konversi,
  }) : super(key: key);

  final Function konversi;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: RaisedButton(
        onPressed: konversi,
        color: Colors.blueAccent,
        textColor: Colors.white,
        child: Text("Convert"),
      ),
    );
  }
}