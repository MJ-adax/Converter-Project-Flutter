import 'package:flutter/material.dart';

class RomanNumbers {
  String _letter = " ";
  String _numberValue = " ";

  RomanNumbers(this._letter, this._numberValue);

  String get letter => _letter;

  set price(String value) {
    _letter = value;
  }

  String get numberValue => _numberValue;

  set icon(String value) {
    _numberValue = value;
  }

}