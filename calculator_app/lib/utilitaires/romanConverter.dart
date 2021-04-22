import 'package:calculator_app/models/romanNumbers.dart';
import 'package:calculator_app/roman_numbers/symbol_utils.dart';
import 'package:calculator_app/roman_numbers/to_decimal_numbers.dart';
import 'package:calculator_app/roman_numbers/to_roman_numbers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RomanConverterPage extends StatefulWidget  {
  RomanConverterPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _RomanConverterPageState createState() => _RomanConverterPageState();
}

class _RomanConverterPageState extends State<RomanConverterPage> {

  //ToDecimalNumbers toDecimalNumbers = ToDecimalNumbers.unicode();
  ToRomanNumbers toRomanNumbers = ToRomanNumbers.unicode();

  var romanNumbersValue = "";
  var decimalFieldResultValue = "0";
  var decimalTextFieldController = TextEditingController();

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
                    romanNumbersValue = toRomanNumbers(int.parse(decimalFieldResultValue)).toString();
                  });
                },
              ),
              Row(
                  children: [
                    Text(
                      "$romanNumbersValue"
                    ),
                    Expanded(child:
                      Row(
                        children: [
                          Expanded(child:
                            ListView.builder(
                                shrinkWrap: true,
                                itemCount: unicodeSymbols.length,
                                itemBuilder: (context, index) {
                                  return new Container(
                                      child :
                                      TextButton(
                                          onPressed: () {
                                            setState(() {
                                              romanNumbersValue += unicodeSymbols[index];
                                              decimalFieldResultValue = toRomanNumbers.inverse()(romanNumbersValue).toString();
                                            });
                                          },
                                          child: Text("${unicodeSymbols[index]}")
                                      )
                                  );
                                }
                            )
                          )
                        ]
                      )
                    )
                  ]
              )
            ],
          )
      ),
    );
  }
}