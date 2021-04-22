import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SaleCalculatorPage extends StatefulWidget  {
  SaleCalculatorPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _SaleCalculatorPageState createState() => _SaleCalculatorPageState();
}

class _SaleCalculatorPageState extends State<SaleCalculatorPage> {
  final priceController = TextEditingController();
  final percentController = TextEditingController();
  double saving = 0;
  double salePrice = 0;
  double savingRounded = 0;
  double salePriceRounded = 0;
   void _calculateSale(double price, int percent) {
     saving = (price * percent) / 100;
     salePrice = price - saving;
     setState(() {
       savingRounded = double.parse(saving.toStringAsFixed(2));
       salePriceRounded = double.parse(salePrice.toStringAsFixed(2));
     });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text("Entrez le prix et selectionnez la promotion à appliquer."),
              Text("Appuyez sur 'Valider' pour connaitre le prix remisé ainsi que l'économie réalisée !"),
              Container(
                padding: EdgeInsets.all(40),
                child: Column(
                  children: [
                    Row(
                        children: [
                          Text("Prix : "),
                          Flexible(
                            child: TextField(
                              controller: priceController,
                              //inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                            ),
                          ),
                          Text(" € ."),
                        ]
                    ),
                    Row(
                        children: [
                          Text("Promotion : "),
                          Flexible(
                            child: TextField(
                              controller: percentController,
                              //inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                            ),
                          ),
                          Text(" % ."),
                        ]
                    ),
                  ],
                )
              ),
              TextButton(
                child: Text("Valider"),
                onPressed: () {
                  _calculateSale(double.parse(priceController.text),int.parse(percentController.text));
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Traitement en Cours')));
                },
              ),
              if (salePrice != 0 && saving != 0)
                Column(
                  children: <Widget>[
                    Text("Prix remisé : $salePriceRounded €"),
                    Text("Economie réalisée : $savingRounded €"),
                  ],
                )
            ]
          )
        )
      ),
    );
  }

}