import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DegreeConverterPage extends StatefulWidget  {
  DegreeConverterPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _DegreeConverterPageState createState() => _DegreeConverterPageState();
}

class _DegreeConverterPageState extends State<DegreeConverterPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Text("// TODO: Ajouter l'utilitaire qui permet de convertir les températures (cf: Story 9)")
      ),
    );
  }

}