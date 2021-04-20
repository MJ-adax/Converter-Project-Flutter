import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SaleCalculatorPage extends StatefulWidget  {
  SaleCalculatorPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SaleCalculatorPageState createState() => _SaleCalculatorPageState();
}

class _SaleCalculatorPageState extends State<SaleCalculatorPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Text("// TODO: Ajouter l'utilitaire qui permet de calculer les promotions (cf: Story 4)")
      ),
    );
  }

}