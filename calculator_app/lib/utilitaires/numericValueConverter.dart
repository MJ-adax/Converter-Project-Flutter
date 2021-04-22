import 'dart:math';

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

  var numeriqueFormat = [
    'dec',
    'bin',
    'hex',
    'oct'
  ];

  var myController1 = TextEditingController();
  var dropdownValue = 'bin';
  var firstFieldResultValue = '0';

  var myController2 = TextEditingController();
  var dropdownValue2 = 'dec';
  var secondFieldResultValue = '0';

  String NumTranslate(String baseValue, String formatToTranslate, String formatTranslated){

    if(formatToTranslate == 'bin' && formatTranslated == 'dec'){
      int res = 0;
      int puis = 1;
      var decimal = baseValue;
      var decimalSplit = decimal.split('');
      for(int i = decimalSplit.length -1; i >= 0; i = i - 1)
      {
        res = res + int.parse(decimalSplit[i])*puis;
        puis = puis *2;
      }
      return res.toString();
    }
    else if(formatToTranslate == 'bin' && formatTranslated == 'oct'){
      int res = 0;
      int puis = 1;
      var decimal = baseValue;
      var decimalSplit = decimal.split('');
      for(int i = decimalSplit.length -1; i >= 0; i = i - 1)
      {
        res = res + int.parse(decimalSplit[i])*puis;
        puis = puis *2;
      }

      var tableau = [];
      num chiffre = 0;
      int resteEntier = 0;
      String resultat = "";
      num nombreDec = res;

      while(nombreDec != 0){
        chiffre = nombreDec % 8;
        resteEntier = chiffre.round();

        tableau.add(resteEntier.toString());
        nombreDec = (nombreDec - chiffre)/8;
      }
      for(int i = tableau.length -1; i >= 0; i = i - 1)
      {
        resultat += tableau[i].toString();
      }

      return (resultat);

    }

    else if(formatToTranslate == 'bin' && formatTranslated == 'hex'){
      int res = 0;
      int puis = 1;
      var decimal = baseValue;
      var decimalSplit = decimal.split('');
      for(int i = decimalSplit.length -1; i >= 0; i = i - 1)
      {
        res = res + int.parse(decimalSplit[i])*puis;
        puis = puis *2;
      }

      var tableau = [];
      String resultat = "";
      int resteEntier = 0;
      num nombreDec = res;
      num chiffre = 0;
      while(nombreDec != 0){
        chiffre = nombreDec % 16;
        resteEntier = chiffre.round();

        tableau.add(resteEntier.toString());
        nombreDec = (nombreDec - chiffre)/16;
      }
      print(tableau);
      for(int i = tableau.length -1; i >= 0; i = i - 1)
      {
        if (tableau[i] == "15")
        {
          tableau[i] = "F";
        }
        else if (tableau[i] == "14")
        {
          tableau[i] = "E";
        }
        else if (tableau[i] == "13")
        {
          tableau[i] ="D";
        }
        else if (tableau[i] == "12")
        {
          tableau[i] ="C";
        }
        else if (tableau[i] == "11")
        {
          tableau[i] ="B";
        }
        else if (tableau[i] == "10")
        {
          tableau[i] ="A";
        }
        resultat += tableau[i].toString();
      }
      return (resultat);


    }
    else if(formatToTranslate == 'dec' && formatTranslated == 'bin'){

      var tableau =[];
      String resultat = "";
      int resteEntier = 0;
      num nombreDec = int.parse(baseValue);
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
      return (resultat);
    }

    else if(formatToTranslate == 'dec' && formatTranslated == 'oct'){
      var tableau = [];
      num chiffre = 0;
      int resteEntier = 0;
      String resultat = "";
      num nombreDec = int.parse(baseValue);

      while(nombreDec != 0){
        chiffre = nombreDec % 8;
        resteEntier = chiffre.round();

        tableau.add(resteEntier.toString());
        nombreDec = (nombreDec - chiffre)/8;
      }
      for(int i = tableau.length -1; i >= 0; i = i - 1)
      {
        resultat += tableau[i].toString();
      }
      return (resultat);
    }
    else if(formatToTranslate == 'dec' && formatTranslated == 'hex'){
      var tableau = [];
      String resultat = "";
      int resteEntier = 0;
      num nombreDec = int.parse(baseValue);
      num chiffre = 0;
      while(nombreDec != 0){
        chiffre = nombreDec % 16;
        resteEntier = chiffre.round();

        tableau.add(resteEntier.toString());
        nombreDec = (nombreDec - chiffre)/16;
      }
      print(tableau);
      for(int i = tableau.length -1; i >= 0; i = i - 1)
      {
        if (tableau[i] == "15")
        {
          tableau[i] = "F";
        }
        else if (tableau[i] == "14")
        {
          tableau[i] = "E";
        }
        else if (tableau[i] == "13")
        {
          tableau[i] ="D";
        }
        else if (tableau[i] == "12")
        {
          tableau[i] ="C";
        }
        else if (tableau[i] == "11")
        {
          tableau[i] ="B";
        }
        else if (tableau[i] == "10")
        {
          tableau[i] ="A";
        }
        resultat += tableau[i].toString();
      }
      return (resultat);

    }
    else if(formatToTranslate == 'hex' && formatTranslated == 'bin'){
      var tableau =[];
      int decimalEntier = 0;
      num decimal = 0;
      String resultat = "";
      int resteEntier = 0;
      num reste = 0;
      num calcul = 0;
      var hexa = baseValue.split('');
      print(hexa.length);
      int j = hexa.length - 1;
      for(int i = 0; i <= hexa.length -1; i = i +1)
      {
        if (hexa[i] == "F")
        {
          hexa[i] = "15";
        }
        else if (hexa[i] == "E")
        {
          hexa[i] = "14";
        }
        else if (hexa[i] == "D")
        {
          hexa[i] ="13";
        }
        else if (hexa[i] == "C")
        {
          hexa[i] ="12";
        }
        else if (hexa[i] == "B")
        {
          hexa[i] ="11";
        }
        else if (hexa[i] == "A")
        {
          hexa[i] ="10";
        }


        if (int.parse(hexa[i]) < 10){
          calcul = int.parse(hexa[i])*pow(16,j);
        }
        else if (int.parse(hexa[i]) >= 10){
          calcul = int.parse(hexa[i])*pow(16,j);
        }
        j = j -1;

        decimalEntier = decimalEntier + calcul.round();

      }
      decimal = decimalEntier;
      print(decimal);
      while(decimal != 0){
        reste = decimal%2;
        resteEntier = reste.round();
        tableau.add(resteEntier.toString());

        decimal = (decimal - reste) /2;
      }
      for(int i = tableau.length -1; i >= 0; i = i - 1)
      {
        resultat += tableau[i].toString();
      }
      return(resultat.toString());

    }
    else if(formatToTranslate == 'hex' && formatTranslated == 'oct'){
      var tableau = [];
      num chiffre = 0;
      int resteEntier = 0;
      String octo = "";
      int decimal = 0;
      num decimalNum = 0;
      num calcul = 0;
      var hexa = baseValue.split('');
      print(hexa.length);
      int j = hexa.length - 1;
      for(int i = 0; i <= hexa.length -1; i = i +1)
      {
        if (hexa[i] == "F")
        {
          hexa[i] = "15";
        }
        else if (hexa[i] == "E")
        {
          hexa[i] = "14";
        }
        else if (hexa[i] == "D")
        {
          hexa[i] ="13";
        }
        else if (hexa[i] == "C")
        {
          hexa[i] ="12";
        }
        else if (hexa[i] == "B")
        {
          hexa[i] ="11";
        }
        else if (hexa[i] == "A")
        {
          hexa[i] ="10";
        }


        if (int.parse(hexa[i]) < 10){
          calcul = int.parse(hexa[i])*pow(16,j);
        }
        else if (int.parse(hexa[i]) >= 10){
          calcul = int.parse(hexa[i])*pow(16,j);
        }
        j = j -1;
        decimal = decimal + calcul.round();

      }
      decimalNum = decimal;
      while(decimalNum != 0){
        chiffre = decimalNum % 8;
        resteEntier = chiffre.round();

        tableau.add(resteEntier.toString());
        decimalNum = (decimalNum - chiffre)/8;
      }
      for(int i = tableau.length -1; i >= 0; i = i - 1)
      {
        octo += tableau[i].toString();
      }
      return (octo);


    }
    else if(formatToTranslate == 'hex' && formatTranslated == 'dec'){
      int resultat = 0;
      num calcul = 0;
      var hexa = baseValue.split('');
      print(hexa.length);
      int j = hexa.length - 1;
      for(int i = 0; i <= hexa.length -1; i = i +1)
      {
        if (hexa[i] == "F")
        {
          hexa[i] = "15";
        }
        else if (hexa[i] == "E")
        {
          hexa[i] = "14";
        }
        else if (hexa[i] == "D")
        {
          hexa[i] ="13";
        }
        else if (hexa[i] == "C")
        {
          hexa[i] ="12";
        }
        else if (hexa[i] == "B")
        {
          hexa[i] ="11";
        }
        else if (hexa[i] == "A")
        {
          hexa[i] ="10";
        }


        if (int.parse(hexa[i]) < 10){
          calcul = int.parse(hexa[i])*pow(16,j);
        }
        else if (int.parse(hexa[i]) >= 10){
          calcul = int.parse(hexa[i])*pow(16,j);
        }
        j = j -1;
        resultat = resultat + calcul.round();

      }
      return(resultat.toString());

    }
    else if(formatToTranslate == 'oct' && formatTranslated == 'dec'){
      num decimalNumber = 0;
      String resultat = "";
      var octaNumber = baseValue.split('');
      int j = octaNumber.length -1;
      print(octaNumber);
      print(octaNumber.length);
      for(int i = 0; i <= octaNumber.length - 1; i++)
        {
          decimalNumber += int.parse(octaNumber[i])*pow(8,j);
          j = j -1;
        }
      resultat = decimalNumber.round().toString();
      return (resultat);
    }
    else if(formatToTranslate == 'oct' && formatTranslated == 'hex'){
      num decimalNumber = 0;
      num decimal = 0;
      var octaNumber = baseValue.split('');
      int j = octaNumber.length -1;
      print(octaNumber);
      print(octaNumber.length);
      for(int i = 0; i <= octaNumber.length - 1; i++)
      {
        decimalNumber += int.parse(octaNumber[i])*pow(8,j);
        j = j -1;
      }
      decimal = decimalNumber.round();

      var tableau = [];
      String resultat = "";
      int resteEntier = 0;
      num chiffre = 0;
      while(decimal != 0){
        chiffre = decimal % 16;
        resteEntier = chiffre.round();

        tableau.add(resteEntier.toString());
        decimal = (decimal - chiffre)/16;
      }
      print(tableau);
      for(int i = tableau.length -1; i >= 0; i = i - 1)
      {
        if (tableau[i] == "15")
        {
          tableau[i] = "F";
        }
        else if (tableau[i] == "14")
        {
          tableau[i] = "E";
        }
        else if (tableau[i] == "13")
        {
          tableau[i] ="D";
        }
        else if (tableau[i] == "12")
        {
          tableau[i] ="C";
        }
        else if (tableau[i] == "11")
        {
          tableau[i] ="B";
        }
        else if (tableau[i] == "10")
        {
          tableau[i] ="A";
        }
        resultat += tableau[i].toString();
      }

      return (resultat);
    }
    else if(formatToTranslate == 'oct' && formatTranslated == 'bin'){
      var tableau =[];
      String resultat = "";
      int resteEntier = 0;
      num nombreOct = int.parse(baseValue);
      num reste = 0;
      while(nombreOct != 0){
        reste = nombreOct%2;
        resteEntier = reste.round();
        tableau.add(resteEntier.toString());

        nombreOct = (nombreOct - reste) /2;
      }
      for(int i = tableau.length -1; i >= 0; i = i - 1)
      {
        resultat += tableau[i].toString();
      }
      return (resultat);
    }
    else {return baseValue;}

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
                  onChanged: (String? selectedValue) {
                    setState(() {
                      dropdownValue = selectedValue!;
                      secondFieldResultValue = NumTranslate(
                          firstFieldResultValue,
                          dropdownValue,
                          dropdownValue2
                      );
                      myController2.text = secondFieldResultValue;
                    });
                  },
                  items: numeriqueFormat
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                TextField(
                  controller: myController1,
                  decoration: InputDecoration(hintText: "Saissez une valeur"),
                  onChanged: (String? inputValue){
                    setState(() {
                      firstFieldResultValue = inputValue!;
                      secondFieldResultValue = NumTranslate(
                          firstFieldResultValue,
                          dropdownValue,
                          dropdownValue2
                      );
                      myController2.text = secondFieldResultValue;
                    });
                  }
                ),
                DropdownButton<String>(
                  value: dropdownValue2,
                  onChanged: (String? selectedValue) {
                    setState(() {
                      dropdownValue2 = selectedValue!;
                      firstFieldResultValue = NumTranslate(
                          secondFieldResultValue,
                          dropdownValue2,
                          dropdownValue
                      );
                      myController1.text = firstFieldResultValue;
                    });
                  },
                  items: numeriqueFormat
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                TextField(
                  controller: myController2,
                  decoration: InputDecoration(hintText: "Saissez une valeur"),
                  onChanged: (String? inputValue){
                    setState((){
                      secondFieldResultValue = inputValue!;
                      firstFieldResultValue = NumTranslate(
                          secondFieldResultValue,
                          dropdownValue2,
                          dropdownValue
                      );
                      myController1.text = firstFieldResultValue;
                    });
                  },
                )
              ],

            ),
          ),
      ),
    );
  }

}

