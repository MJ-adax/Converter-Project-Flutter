import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimesUpCalculatorPage extends StatefulWidget  {
  TimesUpCalculatorPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _TimesUpCalculatorPageState createState() => _TimesUpCalculatorPageState();
}

class _TimesUpCalculatorPageState extends State<TimesUpCalculatorPage> {

  int nbYears = 0;
  int nbMonths = 0;
  int nbDays = 0;

  DateTime fromDate =
  DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  DateTime toDate =
  DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  Future<DateTime> selectDate(BuildContext context, DateTime _date) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(1800),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      _date = picked;
    }
    return _date;
  }

  /// Function to calculate the difference between two dates.
  void _calculateTimesUp(DateTime fromDate, DateTime toDate) {
    setState(() {
       nbYears = toDate.year - fromDate.year;
      nbMonths = toDate.month - fromDate.month;
      nbDays = toDate.day - fromDate.day;
      if (nbMonths < 0 || (nbMonths == 0 && nbDays < 0)) {
        nbYears--;
        nbMonths += (nbDays < 0 ? 11 : 12);
      }
      if (nbDays < 0) {
        final monthAgo = DateTime(toDate.year, toDate.month - 1, fromDate.day);
        nbDays = toDate.difference(monthAgo).inDays + 1;
      }
    });
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
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: <Widget>[
                    Text(
                      'From :',
                      style: TextStyle(height: 2, fontSize: 25)
                    ),
                    Text(
                        "${fromDate.toLocal()}".split(' ')[0],
                        style: TextStyle(height: 3, fontSize: 25)
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20, bottom: 20),
                      width: 85,
                      height: 75,

                      child: ElevatedButton(
                        child: Icon(
                            Icons.calendar_today,
                            size: 25
                        ),
                        onPressed: () async {
                          fromDate = await selectDate(context, fromDate);
                          setState(() {});
                        },
                      ),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                        'To :',
                        style: TextStyle(height: 2, fontSize: 25)
                    ),
                    Text(
                        "${toDate.toLocal()}".split(' ')[0],
                        style: TextStyle(height: 3, fontSize: 25)
                    ),

                    Container(
                      padding: EdgeInsets.only(top: 20, bottom: 20),
                      width: 85,
                      height: 75,
                      child: ElevatedButton(
                        child: Icon(
                          Icons.calendar_today,
                          size: 25
                        ),
                        onPressed: () async {
                        toDate = await selectDate(context, toDate);
                        setState(() {});
                        },
                      )
                    )
                  ],
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 60, bottom: 30),
              width: 300,
              height: 50,
              child: ElevatedButton(
                child: Text("Calculer"),
                style: ElevatedButton.styleFrom(
                  textStyle: TextStyle(
                    fontSize: 20,
                  ),
                ),
                onPressed: () {
                  _calculateTimesUp(fromDate, toDate);
                },
              ),
            ),

            if (nbYears != 0 || nbMonths != 0 || nbDays != 0)
              Text(
                "Il y a $nbYears années, $nbMonths mois et $nbDays jours qui séparent les deux dates", style: TextStyle( fontSize: 20)
              ),
          ],
        )
      ),
    );
  }
}