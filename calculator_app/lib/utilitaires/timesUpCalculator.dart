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
      firstDate: DateTime(2018),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      _date = picked;
    }
    return _date;
  }

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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: <Widget>[
                    Text('From:'),
                    Text("${fromDate.toLocal()}".split(' ')[0]),
                    IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: () async {
                        fromDate = await selectDate(context, fromDate);
                        setState(() {});
                      },
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text('To:'),
                    Text("${toDate.toLocal()}".split(' ')[0]),
                    IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: () async {
                        toDate = await selectDate(context, toDate);
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ],
            ),
            TextButton(
                onPressed: () {
                  _calculateTimesUp(fromDate, toDate);
                },
                child: Text("Valider")
            ),
            Text(
              "Il y a $nbYears années, $nbMonths mois et $nbDays jours qui séparent les deux dates"
            ),
          ],
        )


      ),
    );
  }

}