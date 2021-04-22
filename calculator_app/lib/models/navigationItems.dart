import 'package:flutter/material.dart';

class NavigationItem {
  String _title = " ";
  Icon _icon = Icon(Icons.add);
  Color _color = Colors.lightBlue;

  NavigationItem(this._title, this._icon, this._color);

  String get title => _title;

  set price(String value) {
    _title = value;
  }

  Icon get icon => _icon;

  set icon(Icon value) {
    _icon = value;
  }

  Color get color => _color;

  set color(Color value) {
    _color = value;
  }

}