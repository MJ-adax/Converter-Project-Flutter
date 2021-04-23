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
  String daysUntilBirthday =  " ";
  String hours=" ", days =" ", months = " ", years =" ", minutes = " ";


  _sinceWhenAmIHere(DateTime date) {
    setState(() {
      dayOfBirth = int.parse(DateFormat("dd").format(date));
      monthOfBirth = int.parse(DateFormat("MM").format(date));
      yearOfBirth = int.parse(DateFormat("yyyy").format(date));
      int dayNow = int.parse(DateFormat("dd").format(DateTime.now()));
      int monthNow = int.parse(DateFormat("MM").format(DateTime.now()));
      int yearNow = int.parse(DateFormat("yyyy").format(DateTime.now()));

      //Résumé age
      years = "Vous avez donc : " + ((yearNow - yearOfBirth)).toString()+ " ans";
      months = ((monthNow - monthOfBirth)).toString() + " mois et";
      days =  ((dayNow - dayOfBirth)).toString()+ " jours";






      _sinceBirth(dayNow, monthNow, yearNow);
    });
  }

  _sinceBirth(int dayNow, int monthNow, int yearNow) {
    //months
    int intMonths, intDays, intHours, intMinutes;
    intMonths = ((yearNow - yearOfBirth) * 12) + (monthNow - monthOfBirth);
    monthsSinceBirth = intMonths.toString()+" mois";
    //days
    intDays = (intMonths * 30) + (dayNow - dayOfBirth);
    daysSinceBirth = intDays.toString()+" jours";
    //hours
    intHours = intDays * 24;
    hoursSinceBirth = intHours.toString()+"h";
    //minutes
    intMinutes = intHours * 60;
    minutesSinceBirth = intMinutes.toString() + "min";
    //seconds
    secondsSinceBirth = (intMinutes * 60).toString() + "s";
  }

  _whenIsMyBirthday() {
    /// On définit la date courante
    DateTime currentTime = DateTime.now();
    DateTime birthday = DateTime(DateTime.now().year, _dateTime.month, _dateTime.day);
    setState(() {
      if(currentTime.year == birthday.year && currentTime.month > birthday.month && currentTime.day > birthday.day) {
        daysUntilBirthday = "Votre prochain anniversaire est dans " + currentTime.difference(birthday).inDays.toString();
      }
      else {
        birthday = DateTime(DateTime.now().year + 1, _dateTime.month, _dateTime.day);
        daysUntilBirthday = "Votre prochain anniversaire est dans " + currentTime.difference(birthday).inDays.toString() + " jours";
      }
    });
  }

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
              Container(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                width: 200,
                height: 75,
                child: ElevatedButton(
                    child: Text("Change the Date"),
                    onPressed: (){
                      // Date picker set ici, dernière date = aujourd'hui
                      showDatePicker(
                          context: context,
                          initialDate: _dateTime,
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now())
                          .then((date) {
                        _dateTime = date!;
                        _sinceWhenAmIHere(date);
                        _whenIsMyBirthday();
                      });
                    }
                  ),
              ),

              //Textes description âges.
              Text("Vous êtes né(e) le : "
                  + DateFormat("EEEE").format(_dateTime).toString()
                  + " " + DateFormat("dd").format(_dateTime).toString()
                  + " " + DateFormat("MMMM").format(_dateTime).toString()
                  + " " + DateFormat("yyyy").format(_dateTime).toString(),
                  style: TextStyle(height: 1, fontSize: 20)
              ),
              Container(
                child: Text(
                    years +" " + months + " " + days,
                    style: TextStyle(height: 2, fontSize: 18)
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 20),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 5, bottom: 10),
                          child: Text(
                              years,
                              style: TextStyle(height: 2, fontSize: 15)
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5, bottom: 10),
                          child: Text(
                              monthsSinceBirth,
                              style: TextStyle(height: 2, fontSize: 15)
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5, bottom: 10),
                          child: Text(
                              daysSinceBirth,
                              style: TextStyle(height: 2, fontSize: 15)
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 20),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 5, bottom: 10),
                          child: Text(
                              hoursSinceBirth,
                              style: TextStyle(height: 2, fontSize: 15)
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5, bottom: 10),
                          child: Text(
                              minutesSinceBirth,
                              style: TextStyle(height: 2, fontSize: 15)
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5, bottom: 10),
                          child: Text(
                              secondsSinceBirth,
                              style: TextStyle(height: 2, fontSize: 15)
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Text(
                  daysUntilBirthday,
                  style: TextStyle(height: 2, fontSize: 18)
              ),
            ]
        ),
      ),
    );
  }

}