import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:core';

class NumericValueConverterPage extends StatefulWidget  {
  NumericValueConverterPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _NumericValueConverterPageState createState() => _NumericValueConverterPageState();
}



class _NumericValueConverterPageState extends State<NumericValueConverterPage> {
  List binaireTab = [1,2,4,8,16,32,64,128];
  String dropdownValue = 'hex';
  String dropdownValue2 = 'hex';
  final valeurController = TextEditingController();
  final valeur2Controller = TextEditingController();

 void convert(value){

    if(dropdownValue == "bin" && dropdownValue2 == "dec"){
      int res = 0;
      int puis = 1;
      var decimal = valeurController.text;
      var decimalSplit = decimal.split('');
      for(int i = decimalSplit.length -1; i >= 0; i = i - 1)
      {
        res = res + int.parse(decimalSplit[i])*puis;
        puis = puis *2;
      }
      valeur2Controller.text= res.toString();

      var tableau =[];
      String resultat = "";
      int resteEntier = 0;
      num nombreDec = int.parse(valeur2Controller.text);
      num reste = 0;
      while(nombreDec != 0){
        reste = nombreDec%2;
        resteEntier = reste.round();
        tableau.add(resteEntier.toString());

        nombreDec = (nombreDec - reste) /2;
      }
      for(int i = tableau.length -1; i >= 0; i = i - 1)
      {
        resultat += tableau[i].toString();
      }
      valeurController.text = resultat;

    }

    if(dropdownValue2 == "dec"){


    }

    //var result =0;
    //for (int i = 0; i <= value.length - 8; i += 8) {
      //final hex = value.substring(i, i + 8);

       //result = int.parse(hex, radix: 16);

    //}
    //return result;

   //int nb = 0;
   //nb = int.parse(valeurController.text);
   //nb = nb + 2;
   //String fin = nb.toString();

   //valeur2Controller.text = fin ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width / 6,
            child: Column(
              children: [
                DropdownButton<String>(
                  value: dropdownValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>['hex', 'dec', 'bin', 'oct']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                TextField(
                  onChanged: convert,
                  controller: valeurController,
                  decoration: InputDecoration(hintText: "Saissez une valeur"),
                ),
                DropdownButton<String>(
                  value: dropdownValue2,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue2 = newValue!;
                    });
                  },
                  items: <String>['hex', 'dec', 'bin', 'oct']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                TextField(
                  onChanged: convert,
                  controller: valeur2Controller,
                  decoration: InputDecoration(hintText: "Saissez une valeur"),
                )
              ],

            ),
          ),
      ),
    );
  }

}

