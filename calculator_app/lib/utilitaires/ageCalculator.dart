import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AgeCalculatorPage extends StatefulWidget  {
  AgeCalculatorPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _AgeCalculatorPageState createState() => _AgeCalculatorPageState();
}

class _AgeCalculatorPageState extends State<AgeCalculatorPage> {

  DateTime _dateTime = DateTime.now();

  int dayOfBirth = 1, monthOfBirth = 1, yearOfBirth = 1993;
  String monthsSinceBirth = " ";
  String daysSinceBirth = " ";
  String hoursSinceBirth = " ";
  String minutesSinceBirth = " ";
  String secondsSinceBirth = " ";
  String hours=" ", days =" ", months = " ", years =" ", minutes = " ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:
        Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                  child: Text("Change the Date"),
                  onPressed: (){
                    showDatePicker(
                        context: context,
                        initialDate: _dateTime,
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now())
                        .then((date) {
                      _dateTime = date!;
                      _sinceWhenAmIHere(date);
                    });
                  }),
              Text("Vous êtes né le : "
                  + DateFormat("EEEE").format(_dateTime).toString()
                  + " " + DateFormat("dd").format(_dateTime).toString()
                  + " " + DateFormat("MMMM").format(_dateTime).toString()
                  + " " + DateFormat("yyyy").format(_dateTime).toString()),
              Text("Vous avez donc : " + days +" " + months + " " + years),
              Text(years),
              Text(monthsSinceBirth),
              Text(daysSinceBirth),
              Text(hoursSinceBirth),
              Text(minutesSinceBirth),
              Text(secondsSinceBirth),

            ]
        ),
      ),
    );
  }

  _openDatePickerOnStart() {
    showDatePicker(
        context: context,
        initialDate: _dateTime,
        firstDate: DateTime(1900),
        lastDate: DateTime.now())
        .then((date) {
      _dateTime = date!;
      _sinceWhenAmIHere(date);
    });
  }

  _sinceWhenAmIHere(DateTime date) {
    setState(() {
      dayOfBirth = int.parse(DateFormat("dd").format(date));
      monthOfBirth = int.parse(DateFormat("MM").format(date));
      yearOfBirth = int.parse(DateFormat("yy").format(date));

      int dayNow = int.parse(DateFormat("dd").format(DateTime.now()));
      int monthNow = int.parse(DateFormat("MM").format(DateTime.now()));
      int yearNow = int.parse(DateFormat("yy").format(DateTime.now()));
      days = ((dayNow - dayOfBirth)).toString()+ " jours";
      months = ((monthNow - monthOfBirth)).toString() + " mois";
      years = ((yearNow - yearOfBirth)).toString()+ " ans";

      _sinceBirth(dayNow, monthNow, yearNow);
    });
  }

  Future _sinceBirth(int dayNow, int monthNow, int yearNow) async {
    int intMonths, intDays, intHours, intMinutes;

    intMonths = ((yearNow - yearOfBirth) * 12) + (monthNow - monthOfBirth);
    monthsSinceBirth = intMonths.toString()+" mois";

    intDays = (intMonths * 30) + (dayNow - dayOfBirth);
    daysSinceBirth = intDays.toString()+" jours";

    intHours = intDays * 24;
    hoursSinceBirth = intHours.toString()+"h";

    intMinutes = intHours * 60;
    minutesSinceBirth = intMinutes.toString() + "min";
    secondsSinceBirth = (intMinutes * 60).toString() + "s";
  }
}