import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimesUpCalculatorPage extends StatefulWidget  {
  TimesUpCalculatorPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _TimesUpCalculatorPageState createState() => _TimesUpCalculatorPageState();
}

class _TimesUpCalculatorPageState extends State<TimesUpCalculatorPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Text("// TODO: Ajouter l'utilitaire qui permet de calculer le temps ecoulés entre deux dates (cf: Story 5)")
      ),
    );
  }

}