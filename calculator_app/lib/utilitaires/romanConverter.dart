import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RomanConverterPage extends StatefulWidget  {
  RomanConverterPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _RomanConverterPageState createState() => _RomanConverterPageState();
}

class _RomanConverterPageState extends State<RomanConverterPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Text("// TODO: Ajouter l'utilitaire qui permet de convertir les décimaux en chiffres romains (cf: Story 10)")
      ),
    );
  }

}