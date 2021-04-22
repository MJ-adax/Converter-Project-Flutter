import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DegreeConverterPage extends StatefulWidget  {
  DegreeConverterPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _DegreeConverterPageState createState() => _DegreeConverterPageState();
}

class _DegreeConverterPageState extends State<DegreeConverterPage> {

  var tempFormat = [ //tableau dea format pour le DropDownButton
    'Celsius',
    'Kelvin',
    'Fahrenheit'
  ];
  var myController1 = TextEditingController();
  var dropdownValue = 'Celsius';
  var firstFieldResultValue = '0';
  var myController2 = TextEditingController();
  var dropdownValue2 = 'Kelvin';
  var secondFieldResultValue = '273.15';

  String tempTranslate(String baseValue, String formatToTranslate, String formatTranslated){
    if(formatToTranslate == 'Celsius' && formatTranslated == 'Kelvin'){
     return (num.parse(baseValue)+ 273.15 ).toString();
    }
    else if(formatToTranslate == 'Celsius' && formatTranslated == 'Fahrenheit'){
      return (num.parse(baseValue)*(9/5) +32).toString();
    }
    else if(formatToTranslate == 'Fahrenheit' && formatTranslated == 'Celsius'){
      return ((num.parse(baseValue)-32)*(5/9) ).toString();
    }
    else if(formatToTranslate == 'Fahrenheit' && formatTranslated == 'Kelvin'){
      return ((num.parse(baseValue)-32)*(5/9)+273.15 ).toString();
    }
    else if(formatToTranslate == 'Kelvin' && formatTranslated == 'Fahrenheit'){
      return ((num.parse(baseValue)- 273.15)*(9/5)+32 ).toString();
    }
    else if(formatToTranslate == 'Kelvin' && formatTranslated == 'Celsius'){
      return (num.parse(baseValue)- 273.15 ).toString();
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
              child: DropdownButton<String>(  //1er DropDown
                dropdownColor: Colors.white60,
                  underline: Container(
                    height: 3,
                    color: Colors.red,
                  ),
                value: dropdownValue,
                onChanged: (String? selectedValue) {
                  setState(() {
                    dropdownValue = selectedValue!;
                  secondFieldResultValue = tempTranslate(
                      firstFieldResultValue,
                      dropdownValue,
                      dropdownValue2

                    );
                    myController2.text = secondFieldResultValue;
                  });
                  },
                  items: tempFormat
                      .map<DropdownMenuItem<String>>((String value) {
                     return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList()),
            ),
            Container(
              padding: const EdgeInsets.only(top: 50, right: 50, left:50 ),
              child: TextField(  //1er TextFields
                controller: myController1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Valeur à convertir',
                ),
                onChanged: (String? inputValue){
                  setState((){
                    firstFieldResultValue = inputValue!;
                    secondFieldResultValue = tempTranslate(
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
              child :DropdownButton<String>(   //2ème dropdown
                dropdownColor: Colors.white60,
                underline: Container(
                  height: 3,
                  color: Colors.red,
                ),
                value: dropdownValue2,
                onChanged: (String? selectedValue) {
                  setState(() {
                    dropdownValue2 = selectedValue!;
                  firstFieldResultValue = tempTranslate(
                      secondFieldResultValue,
                      dropdownValue2,
                      dropdownValue

                    );
                    myController1.text = firstFieldResultValue;
                  });
                },
                items: tempFormat
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
              padding: const EdgeInsets.only(top: 50, right: 50, left:50 ),
              child: TextField( //2ème TextFields
                controller: myController2,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Valeur à convertir',
                ),
                onChanged: (String? inputValue){
                  setState((){
                    secondFieldResultValue = inputValue!;
                    firstFieldResultValue = tempTranslate(
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