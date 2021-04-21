import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DegreeConverterPage extends StatefulWidget  {
  DegreeConverterPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _DegreeConverterPageState createState() => _DegreeConverterPageState();
}

class _DegreeConverterPageState extends State<DegreeConverterPage> {

  String dropdownValue = 'Celsius';
  String dropdownValue2 = 'Kelvin';
  var myController1 = TextEditingController();
  var myController2 = TextEditingController();
  num dValue = 0;
  num cValue = 0;
  num kValue = 0;
  num fValue = 0;



//   void stringToDouble(tValue) {
//     dValue = double.parse(tValue);
//  }
//
//
//   resultatDansTextfield2(value){
//     myController2.text = '$kValue' ;
// }
 celsiusToKelvin(String tValue){
    dValue = num.parse('$tValue');
    kValue = dValue + 273.15;
    myController2.text = kValue.toStringAsFixed(2);
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
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              onChanged: (String? newValue){
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: <String>['Celsius', 'Kelvin', 'Farenheit']
                .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              })
              .toList(),

            ),
            TextField(
              controller: myController1,
            //  onChanged: celsiusToKelvin(myController1.text),






            ),
            DropdownButton<String>(
              value: dropdownValue2,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              onChanged: (String? newValue2){
                setState(() {
                  dropdownValue2 = newValue2!;
                });
              },
              items: <String>['Celsius', 'Kelvin', 'Farenheit']
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
          //    onChanged: celsiusToKelvin(myController2.text),






            ),




            // ElevatedButton(
            //   child: Text('convert'),
            //   onPressed: () => {
            //     celsiusToKelvin(myController1.text),
            //
            //
            //   },
            //
            // ),
          ],
        ),
      ),
    );
  }

}