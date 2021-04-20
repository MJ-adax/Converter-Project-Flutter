import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NumericValueConverterPage extends StatefulWidget  {
  NumericValueConverterPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _NumericValueConverterPageState createState() => _NumericValueConverterPageState();
}

class _NumericValueConverterPageState extends State<NumericValueConverterPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Text("// TODO: Ajouter l'utilitaire qui permet de convertir les valeurs numeriques (cf: Story 7)")
      ),
    );
  }

}