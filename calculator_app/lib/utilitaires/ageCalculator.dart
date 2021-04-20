import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AgeCalculatorPage extends StatefulWidget  {
  AgeCalculatorPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _AgeCalculatorPageState createState() => _AgeCalculatorPageState();
}

class _AgeCalculatorPageState extends State<AgeCalculatorPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Text("// TODO: Ajouter l'utilitaire qui permet de connaitre son age (cf: Story 3)")
      ),
    );
  }

}