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

  /// Function to calculate promotion between a price and a reduction.
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
              Text(
                  "Entrez le prix et selectionnez la promotion à appliquer.",
                  style: TextStyle(height: 2, fontSize: 20)
              ),
              Text(
                  "Appuyez sur 'Valider' pour connaitre le prix remisé ainsi que l'économie réalisée !",
                  style: TextStyle(height: 2, fontSize: 20)
              ),
              Container(
                width: 400,
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                            child: TextField(
                              controller: priceController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Prix'
                              ),
                            ),
                          ),
                          Text(" € ."),
                        ]
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                            child: TextField(
                              controller: percentController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Promotion'
                              ),
                            ),
                          ),
                          Text(" % ."),
                        ]
                      ),
                    ),
                  ],
                )
              ),

              ElevatedButton(
                child: Text("Convertir"),
                style: ElevatedButton.styleFrom(
                  textStyle: TextStyle(
                      fontSize: 20,
                  ),
                ),
                onPressed: () {
                  _calculateSale(double.parse(priceController.text),int.parse(percentController.text));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Traitement en Cours')));
                },
              ),
              if (salePrice != 0 && saving != 0)
                Container(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text("Prix remisé : $salePriceRounded €", style: TextStyle(fontSize: 20)),
                      Text("Economie réalisée : $savingRounded €", style: TextStyle( fontSize: 20)),
                    ],
                  )
                )
            ]
          )
        )
      ),
    );
  }
}