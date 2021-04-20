import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DistanceConverterPage extends StatefulWidget  {
  DistanceConverterPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _DistanceConverterPageState createState() => _DistanceConverterPageState();
}

class _DistanceConverterPageState extends State<DistanceConverterPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Text("// TODO: Ajouter l'utilitaire qui permet de convertir les unités de distance (cf: Story 6)")
      ),
    );
  }

}