import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DistanceConverterPage extends StatefulWidget  {
  DistanceConverterPage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  _DistanceConverterPageState createState() => _DistanceConverterPageState();
}

class _DistanceConverterPageState extends State<DistanceConverterPage> {

  var firstTextFieldController = TextEditingController();
  var secondTextFieldController = TextEditingController();
  //On utilise l'id pour référencer la distance.
  var _sizeFormat = [
    "Millimètres (mm)",
    "Centimètres (cm)",
    "Décimètres (dm)",
    "Mètres (m)",
    "Décamètres (decm)",
    "Hectomètres (hm)",
    "Kilomètres (km)",
    "Pouces (in)",
    "Pieds (ft)",
    "Yards (y)"
  ];
  var _firstFieldSelectedValue = "Mètres (m)";
  var _firstFieldResultValue = "1";
  var _secondFieldSelectedValue = "Yards (y)";
  var _secondFieldResultValue = "1.09";

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
                            _secondFieldResultValue = _distanceTranslate(
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
                    labelText: 'Distance à convertir',
                  ),
                  onChanged: (String? inputValue){
                    setState((){
                      _firstFieldResultValue = inputValue!;
                      _secondFieldResultValue = _distanceTranslate(
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
                                _firstFieldResultValue = _distanceTranslate(
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
                        labelText: 'Distance convertie',
                      ),
                      onChanged: (String? inputValue){
                        setState((){
                          _secondFieldResultValue = inputValue!;
                          _firstFieldResultValue = _distanceTranslate(
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

  // En fonction du format de translate, demande beaucoup de vérification.
  String _distanceTranslate(String baseValue, int formatToTranslate, int formatTranslated) {
    if(formatToTranslate < 8 && formatTranslated < 8) {
      print("inf 8");
      return _distanceTranslateMetricToMetric(baseValue, formatToTranslate, formatTranslated); // When converting metric system to Metric system
    }
    else if(formatToTranslate >= 8 && formatTranslated >= 8) {
      print("sup 8");
      return _distanceTranslateImperialToImperial(baseValue, formatToTranslate, formatTranslated);// When converting imperial system to imperial system
    }
    else if(formatToTranslate < 8 && formatTranslated >= 8) {
      print("metric to imp");
      return _distanceTranslateMetricToImperial(baseValue, formatToTranslate, formatTranslated);// When converting metric system to imperial system
    }
    else if( formatTranslated < 8 && formatToTranslate >= 8) {
      print("imp to met");
      return _distanceTranslateImperialToMetric(baseValue, formatToTranslate, formatTranslated);// When converting imperial system to Metric system
    }
    return '';
  }
}

  //Très peu maintenable, mais valeur fixe => en faire une interface / library
  String _distanceTranslateMetricToMetric(String baseValue, int formatToTranslate, int formatTranslated) {
    print("METRIC TO METRIC");
    if(formatToTranslate > formatTranslated){
      return (num.parse(baseValue)*pow(10, formatToTranslate - formatTranslated)).toString();
    } else {
      return (num.parse(baseValue)/pow(10, formatTranslated - formatToTranslate)).toString();
    }
  }

  String _distanceTranslateImperialToImperial(baseValue, formatToTranslate, formatTranslated) {
    print("IMPERIAL TO IMPERIAL");
    switch(formatToTranslate) {
      case 8 :
        switch(formatTranslated) {
          case 8 : return baseValue;
          case 9 : return (num.parse(baseValue) / 12 ).toString();
          case 10 : return (num.parse(baseValue) / 36 ).toString();
        }
        break;
      case 9 :
        switch(formatTranslated) {
          case 8 : return (num.parse(baseValue) * 12 ).toString();
          case 9 : return baseValue;
          case 10 : return (num.parse(baseValue) / 3 ).toString();
        }
        break;
      case 10:
        switch(formatTranslated) {
          case 8 : return (num.parse(baseValue) * 12 ).toString();
          case 9 : return (num.parse(baseValue) * 3 ).toString();
          case 10 : return baseValue;
        }
        break;
    }
    return '';
  }

  String _distanceTranslateMetricToImperial(baseValue, formatToTranslate, formatTranslated) {
    print("METRIC TO IMPERIAL");
    switch(formatToTranslate) {
      case 1 :
        switch(formatTranslated) {
          case 8 : return (num.parse(baseValue) / 25.4 ).toString();
          case 9 : return (num.parse(baseValue) / 305 ).toString();
          case 10 : return (num.parse(baseValue) / 914 ).toString();
        }
        break;
      case 2 :
        switch(formatTranslated) {
          case 8 : return (num.parse(baseValue) / 2.54 ).toString();
          case 9 : return (num.parse(baseValue) / 30.5 ).toString();
          case 10 : return (num.parse(baseValue) / 3.6 ).toString();
        }
        break;
      case 3 :
        switch(formatTranslated) {
          case 8 : return (num.parse(baseValue) * 3.937 ).toString();
          case 9 : return (num.parse(baseValue) / 3.048 ).toString();
          case 10 : return (num.parse(baseValue) / 9.144 ).toString();
        }
        break;
      case 4 :
        print("METERS TO ...");
        switch(formatTranslated) {
          case 8 : return (num.parse(baseValue) * 39.73 ).toString();
          case 9 : return (num.parse(baseValue) *  3.281).toString();
          case 10 : return (num.parse(baseValue) * 1.094 ).toString();
        }
        break;
      case 5 :
        switch(formatTranslated) {
          case 8 : return (num.parse(baseValue) * 394 ).toString();
          case 9 : return (num.parse(baseValue) * 32.808 ).toString();
          case 10 : return (num.parse(baseValue) * 10.936 ).toString();
        }
        break;
      case 6 :
        switch(formatTranslated) {
          case 8 : return (num.parse(baseValue) * 3937 ).toString();
          case 9 : return (num.parse(baseValue) * 328 ).toString();
          case 10 : return (num.parse(baseValue) * 109 ).toString();
        }
        break;
      case 7 :
        switch(formatTranslated) {
          case 8 : return (num.parse(baseValue) * 39370 ).toString();
          case 9 : return (num.parse(baseValue) * 3281 ).toString();
          case 10 : return (num.parse(baseValue) * 1094 ).toString();
        }
        break;
    }
    return '';
  }

  String _distanceTranslateImperialToMetric(baseValue, formatToTranslate, formatTranslated) {
    print("IMPERIAL TO METRIC");
    switch(formatToTranslate){
      case 8 :
        switch(formatTranslated) {
          case 1 : return (num.parse(baseValue) * 25.4 ).toString();
          case 2 : return (num.parse(baseValue) * 2.54 ).toString();
          case 3 : return (num.parse(baseValue) / 3.937 ).toString();
          case 4 : return (num.parse(baseValue) / 39.37 ).toString();
          case 5 : return (num.parse(baseValue) / 394 ).toString();
          case 6 : return (num.parse(baseValue) / 3937 ).toString();
          case 7 : return (num.parse(baseValue) / 39370 ).toString();
        }
        break;
      case 9 :
        switch(formatTranslated) {
          case 1 : return (num.parse(baseValue) * 305 ).toString();
          case 2 : return (num.parse(baseValue) * 30.48 ).toString();
          case 3 : return (num.parse(baseValue) * 3.048 ).toString();
          case 4 : return (num.parse(baseValue) / 3.281 ).toString();
          case 5 : return (num.parse(baseValue) / 32.808 ).toString();
          case 6 : return (num.parse(baseValue) / 328 ).toString();
          case 7 : return (num.parse(baseValue) / 3281 ).toString();
        }
        break;
      case 10 :
        switch(formatTranslated) {
          case 1 : return (num.parse(baseValue) * 914 ).toString();
          case 2 : return (num.parse(baseValue) * 91.44 ).toString();
          case 3 : return (num.parse(baseValue) * 9.144 ).toString();
          case 4 : return (num.parse(baseValue) / 1.094 ).toString();
          case 5 : return (num.parse(baseValue) / 10.936 ).toString();
          case 6 : return (num.parse(baseValue) / 109 ).toString();
          case 7 : return (num.parse(baseValue) / 1094 ).toString();
        }
        break;
    }
    return '';
  }

