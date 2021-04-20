import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AreaConverterPage extends StatefulWidget  {
  AreaConverterPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _AreaConverterPageState createState() => _AreaConverterPageState();
}

class _AreaConverterPageState extends State<AreaConverterPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Text("// TODO: Ajouter l'utilitaire qui permet de convertir les aires (cf: Story 8)")
      ),
    );
  }

}