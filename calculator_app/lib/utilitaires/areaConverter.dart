import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AreaConverterPage extends StatefulWidget  {
  AreaConverterPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _AreaConverterPageState createState() => _AreaConverterPageState();
}

class _AreaConverterPageState extends State<AreaConverterPage> {

  var areaFormat = [
    'km²',
    'm²',
    'cm²',
    'ha',
    'Acre'
  ];

  var myController1 = TextEditingController();
  var dropdownValue = 'km²';
  var firstFieldResultValue = '0';

  var myController2 = TextEditingController();
  var dropdownValue2 = 'm²';
  var secondFieldResultValue = '273.15';

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
            DropdownButton<String>(

                value: dropdownValue,
                onChanged: (String? selectedValue) {
                  setState(() {
                    dropdownValue = selectedValue!;
                    // secondFieldResultValue = areaTranslate(
                    //     firstFieldResultValue,
                    //     dropdownValue,
                    //     dropdownValue2
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
            TextField(
              controller: myController1,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Valeur à convertir',
              ),
              onChanged: (String? inputValue){
                setState((){
                  secondFieldResultValue = areaTranslate(
                      firstFieldResultValue,
                      dropdownValue,
                      dropdownValue2
                  );
                  myController2.text = secondFieldResultValue;
                });
              },
            ),
            DropdownButton<String>(
              value: dropdownValue2,
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

            TextField(
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

          ],
        ),
      ),
    );
  }

}