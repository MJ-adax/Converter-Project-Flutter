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

  ToRomanNumbers toRomanNumbers = ToRomanNumbers.standard();
  ToDecimalNumbers toDecimalNumbers = ToDecimalNumbers.standard();

  var romanNumbersValue = "";
  var decimalFieldResultValue = "0";
  var decimalTextFieldController = TextEditingController();

  var errors = [];

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
                    decimalTextFieldController.text = decimalFieldResultValue;
                    try {
                      romanNumbersValue = toRomanNumbers(int.parse(decimalFieldResultValue)).toString();
                    } catch (e){
                      if(!errors.contains("Votre nombre décimal est trop grand, il ne peut dépasser 3999") ){
                        errors.add("Votre nombre décimal est trop grand, il ne peut dépasser 3999");
                      }
                    }

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
                                itemCount: standardSymbols.length,
                                itemBuilder: (context, index) {
                                  return new Container(
                                      child :
                                      TextButton(
                                          onPressed: () {
                                            setState(() {
                                              romanNumbersValue += standardSymbols[index];
                                              decimalTextFieldController.text = decimalFieldResultValue;
                                              try {
                                                decimalFieldResultValue = toDecimalNumbers(romanNumbersValue).toString();
                                              } catch (e){
                                                if(!errors.contains("Une erreur est survenue, veuillez réinitialiser votre nombre romain") ){
                                                  errors.add("Une erreur est survenue, veuillez réinitialiser votre nombre romain");
                                                }
                                              }
                                            });
                                          },
                                          child: Text("${standardSymbols[index]}")
                                      )
                                  );
                                }
                            )
                          ),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  romanNumbersValue = "";
                                  decimalFieldResultValue = "";
                                  decimalTextFieldController.text = decimalFieldResultValue;
                                  errors = [];
                                });

                              },
                              child:
                                Icon(Icons.delete)
                          )
                        ]
                      )
                    ),

                  ],
              ),
              Expanded(child:
                ListView.builder(
                    itemCount: errors.length,
                    itemBuilder: (context, index){
                      return Text(errors[index],
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      );
                    }

                )
              )
            ],
          )
      ),
    );
  }
}