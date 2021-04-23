import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AreaConverterPage extends StatefulWidget  {
  AreaConverterPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _AreaConverterPageState createState() => _AreaConverterPageState();
}

class _AreaConverterPageState extends State<AreaConverterPage> {
  var myController1 = TextEditingController();
  var dropdownValue = 'km²';
  var firstFieldResultValue = '0';
  var myController2 = TextEditingController();
  var dropdownValue2 = 'm²';
  var secondFieldResultValue = '273.15';
  var areaFormat = [
    'km²',
    'm²',
    'cm²',
    'ha',
    'Acre'
  ];

  String areaTranslate(String baseValue, String formatToTranslate, String formatTranslated){

    if(formatToTranslate == 'km²' && formatTranslated == 'm²'){
      return (num.parse(baseValue)*(pow(10, 6)) ).toString();
    }
    else if(formatToTranslate == 'km²' && formatTranslated == 'cm²'){
      return (num.parse(baseValue)*(pow(10, 10)) ).toString();
    }
    else if(formatToTranslate == 'km²' && formatTranslated == 'ha'){
      return (num.parse(baseValue)*100 ).toString();
    }
    else if(formatToTranslate == 'km²' && formatTranslated == 'Acre'){
      return (num.parse(baseValue)*247.105).toString();
    }
    else if(formatToTranslate == 'm²' && formatTranslated == 'km²'){
      return (num.parse(baseValue)/(pow(10, 6)) ).toString();
    }
    else if(formatToTranslate == 'm²' && formatTranslated == 'cm²'){
      return (num.parse(baseValue)*(pow(10, 4)) ).toString();
    }
    else if(formatToTranslate == 'm²' && formatTranslated == 'ha'){
      return (num.parse(baseValue)/(pow(10, 4)) ).toString();
    }
    else if(formatToTranslate == 'm²' && formatTranslated == 'Acre'){
      return (num.parse(baseValue)/4046.86).toString();
    }
    else if(formatToTranslate == 'cm²' && formatTranslated == 'km²'){
      return (num.parse(baseValue)/(pow(10, 10)) ).toString();
    }
    else if(formatToTranslate == 'cm²' && formatTranslated == 'm²'){
      return (num.parse(baseValue)/(pow(10, 4)) ).toString();
    }
    else if(formatToTranslate == 'cm²' && formatTranslated == 'ha'){
      return (num.parse(baseValue)/(pow(10, 8)) ).toString();
    }
    else if(formatToTranslate == 'cm²' && formatTranslated == 'Acre'){
      return ((num.parse(baseValue)/4.047)/pow(10,7) ).toString();
    }
    else if(formatToTranslate == 'ha' && formatTranslated == 'km²'){
      return (num.parse(baseValue)/100 ).toString();
    }
    else if(formatToTranslate == 'ha' && formatTranslated == 'm²'){
      return (num.parse(baseValue)*pow(10, 4) ).toString();
    }
    else if(formatToTranslate == 'ha' && formatTranslated == 'cm²'){
        return (num.parse(baseValue)*pow(10, 8) ).toString();
    }
    else if(formatToTranslate == 'ha' && formatTranslated == 'Acre'){
      return (num.parse(baseValue)*2.47105 ).toString();
    }
    else if(formatToTranslate == 'Acre' && formatTranslated == 'km²'){
      return (num.parse(baseValue)/247 ).toString();
    }
    else if(formatToTranslate == 'Acre' && formatTranslated == 'm²'){
      return (num.parse(baseValue)*4046.86 ).toString();
    }
    else if(formatToTranslate == 'Acre' && formatTranslated == 'cm²'){
      return ((num.parse(baseValue)*4.047)/pow(10,7) ).toString();
    }
    else if(formatToTranslate == 'Acre' && formatTranslated == 'ha'){
      return (num.parse(baseValue)/2.47105 ).toString();
    }
    else {return baseValue;}
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController1.dispose();
    myController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(

          children : <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 50, right: 50, left:50 ),
            child: DropdownButton<String>( //1er DropDown
              dropdownColor: Colors.white60,
                value: dropdownValue,
                underline: Container(
                  height: 3,
                  color: Colors.red,
                ),
                onChanged: (String? selectedValue) {
                  setState(() {
                    dropdownValue = selectedValue!;
                    secondFieldResultValue = areaTranslate(
                        firstFieldResultValue,
                        dropdownValue,
                        dropdownValue2
                    );
                    myController2.text = secondFieldResultValue;
                  });
                },
                items: areaFormat
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList()),
          ),
          Container(
            padding: const EdgeInsets.only(top: 50, right: 50, left:50 ),
            child:  TextField(   //1er TextField
                controller: myController1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Valeur à convertir',
                ),
                onChanged: (String? inputValue){
                  setState((){
                    firstFieldResultValue = inputValue!;
                    secondFieldResultValue = areaTranslate(
                        firstFieldResultValue,
                        dropdownValue,
                        dropdownValue2
                    );
                    myController2.text = secondFieldResultValue;
                  });
                },
              ),
        ),
            Container(
             padding: const EdgeInsets.only(top: 200, right: 50, left:50 ),
             child: DropdownButton<String>(     //2ème DropDown
               dropdownColor: Colors.white60,
                value: dropdownValue2,
                underline: Container(
                  height: 3,
                  color: Colors.red,
                ),
                onChanged: (String? selectedValue) {
                  setState(() {
                    dropdownValue2 = selectedValue!;
                    firstFieldResultValue = areaTranslate(
                        secondFieldResultValue,
                        dropdownValue2,
                        dropdownValue
                    );
                    myController1.text = firstFieldResultValue;
                  });
                },
                items: areaFormat
                    .map<DropdownMenuItem<String>>((String value2) {
                  return DropdownMenuItem<String>(
                    value: value2,
                    child: Text(value2),
                  );
                })
                    .toList(),
              ),
        ),
            Container(
              padding: const EdgeInsets.only(bottom: 50, right: 50, left:50 ),
            child : TextField( //2ème TextField
              controller: myController2,

              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Valeur à convertir',
              ),

              onChanged: (String? inputValue){
                setState((){
                  secondFieldResultValue = inputValue!;
                  firstFieldResultValue = areaTranslate(
                      secondFieldResultValue,
                      dropdownValue2,
                      dropdownValue
                  );
                  myController1.text = firstFieldResultValue;
                });
              },
            ),
            ),
          ],
        ),
      ),
    );
  }
}