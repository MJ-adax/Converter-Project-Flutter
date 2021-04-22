import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RomanConverterPage extends StatefulWidget  {
  RomanConverterPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _RomanConverterPageState createState() => _RomanConverterPageState();
}

class _RomanConverterPageState extends State<RomanConverterPage> {

  var _romanConverter = {
    "I" : "1",
    "V" : "5",
    "X" : "10",
    "L" : "50",
    "C" : "100",
    "D" : "500",
    "M" : "1000"
  };

  var romanNumbersValue = "";
  var decimalFieldResultValue = "0";
  var decimalTextFieldController = TextEditingController();

  String _romanNumbersTranslate(String baseValue, int formatToTranslate, int formatTranslated){

    return " ";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
            children: [
              TextField(
                controller: decimalTextFieldController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Valeur à convertir',
                ),
                onChanged: (String? inputValue){
                  setState((){
                    decimalFieldResultValue = inputValue!;
                  });
                },
              ),
              Column(
                  children: [
                    Text(
                      "$romanNumbersValue"
                    ),
                    Row(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: _romanConverter.length,
                          itemBuilder: (context, index) {
                            return TextButton(
                                onPressed: () {
                                  print("Hello");
                                },
                                child: Text("${_romanConverter[index]}")
                            );
                          }
                          )
                      ],
                    )
                  ]
              )
            ],
          )
      ),
    );
  }

}