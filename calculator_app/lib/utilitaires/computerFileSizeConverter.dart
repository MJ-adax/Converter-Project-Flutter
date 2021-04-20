import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ComputerFileSizeConverterPage extends StatefulWidget  {
  ComputerFileSizeConverterPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ComputerFileSizePageState createState() => _ComputerFileSizePageState();
}

class _ComputerFileSizePageState extends State<ComputerFileSizeConverterPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Text("// TODO: Ajouter l'utilitaire qui convertit les tailles de fichiers (cf: Story 2)")
      ),
    );
  }

}