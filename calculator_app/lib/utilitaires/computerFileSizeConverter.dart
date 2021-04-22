import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ComputerFileSizeConverterPage extends StatefulWidget {
  ComputerFileSizeConverterPage({Key? key, required this.title})
      : super(key: key);
  final String title;
  @override
  _ComputerFileSizePageState createState() => _ComputerFileSizePageState();
}

class _ComputerFileSizePageState extends State<ComputerFileSizeConverterPage> {
  var firstTextFieldController = TextEditingController();
  var secondTextFieldController = TextEditingController();
  var _firstFieldSelectedValue = "Octet (o)";
  var _firstFieldResultValue = "67";
  var _secondFieldSelectedValue = "GigaOctet (Go)";
  var _secondFieldResultValue = "0";
  var _sizeFormat = [
    "Octet (o)",
    "KiloOctet (Ko)",
    "MegaOctet (Mo)",
    "GigaOctet (Go)",
    "TeraOctet (To)",
    "PetaOctet (Po)"
  ];


   String _fileSizeTranslate(String baseValue, int formatToTranslate, int formatTranslated){
    if(formatToTranslate > formatTranslated){
      return (num.parse(baseValue)*pow(1000, formatToTranslate - formatTranslated)).toString();
    } else {
      return (num.parse(baseValue)/pow(1000, formatTranslated - formatToTranslate)).toString();
    }
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
          Column(children: [
            DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                    value: _firstFieldSelectedValue,
                    onChanged: (String? selectedValue) {
                      setState(() {
                        _firstFieldSelectedValue = selectedValue!;
                        _secondFieldResultValue = _fileSizeTranslate(
                            _firstFieldResultValue,
                            _sizeFormat.indexOf(_firstFieldSelectedValue)+1,
                            _sizeFormat.indexOf(_secondFieldSelectedValue)+1
                        );
                        secondTextFieldController.text = _secondFieldResultValue;
                      });
                    },
                    items: _sizeFormat
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList())),
            TextField(
              controller: firstTextFieldController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Valeur à convertir',
              ),
              onChanged: (String? inputValue){
                setState((){
                  _firstFieldResultValue = inputValue!;
                  _secondFieldResultValue = _fileSizeTranslate(
                      _firstFieldResultValue,
                      _sizeFormat.indexOf(_firstFieldSelectedValue)+1,
                      _sizeFormat.indexOf(_secondFieldSelectedValue)+1
                  );
                  secondTextFieldController.text = _secondFieldResultValue;
                });
              },
            ),
          ]),
          Column(
            children: [
              DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                      value: _secondFieldSelectedValue,
                      onChanged: (String? selectedValue) {
                        setState(() {
                          _secondFieldSelectedValue = selectedValue!;
                          _firstFieldResultValue = _fileSizeTranslate(
                              _secondFieldResultValue,
                              _sizeFormat.indexOf(_secondFieldSelectedValue)+1,
                              _sizeFormat.indexOf(_firstFieldSelectedValue)+1
                          );
                          firstTextFieldController.text = _firstFieldResultValue;
                        });
                      },
                      items: _sizeFormat
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList())),
              TextField(
                controller: secondTextFieldController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Valeur convertie',
                ),
                onChanged: (String? inputValue){
                  setState((){
                    _secondFieldResultValue = inputValue!;
                    _firstFieldResultValue = _fileSizeTranslate(
                        _secondFieldResultValue,
                        _sizeFormat.indexOf(_secondFieldSelectedValue)+1,
                        _sizeFormat.indexOf(_firstFieldSelectedValue)+1
                    );
                    firstTextFieldController.text = _firstFieldResultValue;
                  });
                },
              ),
            ]
          )
        ],
      )),
    );
  }
}
