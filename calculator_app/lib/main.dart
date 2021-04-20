import 'package:calculator_app/utilitaires/ageCalculator.dart';
import 'package:calculator_app/utilitaires/areaConverter.dart';
import 'package:calculator_app/utilitaires/computerFileSizeConverter.dart';
import 'package:calculator_app/utilitaires/degreeConverter.dart';
import 'package:calculator_app/utilitaires/distanceConverter.dart';
import 'package:calculator_app/utilitaires/numericValueConverter.dart';
import 'package:calculator_app/utilitaires/romanConverter.dart';
import 'package:calculator_app/utilitaires/saleCalculator.dart';
import 'package:calculator_app/utilitaires/timesUpCalculator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Convertisseur BB'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void navigateToComputerFileSizePage(){
    Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
      return new ComputerFileSizeConverterPage(
          title: "Convertisseur de Fichiers Informatiques"
      );
    }));
  }

  void navigateToAgeCalculatorPage(){
    Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
      return new AgeCalculatorPage(
          title: "Calculateur d'Age"
      );
    }));
  }

  void navigateToSaleCalculatorPage(){
    Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
      return new SaleCalculatorPage(
          title: "Calculateur de Promotions"
      );
    }));
  }
  void navigateToTimesUpCalculatorPage(){
    Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
      return new TimesUpCalculatorPage(
          title: "Calculateur de temps écoulés"
      );
    }));
  }

  void navigateToDistanceConverterPage(){
    Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
      return new DistanceConverterPage(
          title: "Convertisseur des unités de distance"
      );
    }));
  }

  void navigateToNumericValueConverterPage(){
    Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
      return new NumericValueConverterPage(
          title: "Convertisseur des valeurs numériques"
      );
    }));
  }

  void navigateToAreaConverterPage(){
    Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
      return new AreaConverterPage(
          title: "Convertisseur des aires"
      );
    }));
  }

  void navigateToDegreeConverterPage(){
    Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
      return new DegreeConverterPage(
          title: "Convertisseur des températures"
      );
    }));
  }

  void navigateToRomanConverterPage(){
    Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
      return new RomanConverterPage(
          title: "Convertisseur des décimaux et chiffres romains"
      );
    }));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),

      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(10),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 3,
        children: <Widget>[

          // Tile "Computer File Size"
          GridTile(
              child: InkResponse(
                enableFeedback: true,
                child: Container(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: <Widget>[
                      Icon(Icons.file_copy_outlined),
                      Text("Taille des fichiers informatiques", textAlign: TextAlign.center),
                    ],
                  ),
                  color: Colors.teal[500],
                ),
                onTap: () => {
                  // Navigation to ComputerFileSizeConverterPage.
                  navigateToComputerFileSizePage()
                },
              )
          ),

          // Tile "Age Calculator Page"
          GridTile(
            child: InkResponse(
              enableFeedback: true,
              child: Container(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: <Widget>[
                    Icon(Icons.calendar_today_sharp),
                    Text("Quel age avez vous ?", textAlign: TextAlign.center),
                  ],
                ),
                color: Colors.teal[100],
              ),
              onTap: () => {
                // Navigation to AgeCalculatorPage.
                navigateToAgeCalculatorPage()
              },
            ),
          ),

          // Tile "Sale Calculator Page"
          GridTile(
              child: InkResponse(
                enableFeedback: true,
                child: Container(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: <Widget>[
                      Icon(Icons.add_shopping_cart),
                      Text("Promotions", textAlign: TextAlign.center),
                    ],
                  ),
                  color: Colors.teal[500],
                ),
                onTap: () => {
                  // Navigation to SaleCalculatorPage.
                  navigateToSaleCalculatorPage()
                },
              )
          ),

          // Tile "Times Up Page"
          GridTile(
              child: InkResponse(
                enableFeedback: true,
                child: Container(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: <Widget>[
                      Icon(Icons.hourglass_bottom),
                      Text("Temps écoulés", textAlign: TextAlign.center),
                    ],
                  ),
                  color: Colors.teal[100],
                ),
                onTap: () => {
                  // Navigation to TimeUpCalculatorPage.
                  navigateToTimesUpCalculatorPage()
                },
              )
          ),

          // Tile "Distance Converter Page"
          GridTile(
              child: InkResponse(
                enableFeedback: true,
                child: Container(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: <Widget>[
                      Icon(Icons.horizontal_rule),
                      Text("Distance", textAlign: TextAlign.center),
                    ],
                  ),
                  color: Colors.teal[500],
                ),
                onTap: () => {
                  // Navigation to DistanceConverterPage
                  navigateToDistanceConverterPage()
                },
              ),
          ),

          // Tile "Numeric Value Converter Page"
          GridTile(
            child: InkResponse(
              enableFeedback: true,
              child : Container(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: <Widget>[
                    Icon(Icons.analytics_outlined),
                    Text("Valeurs Numeriques", textAlign: TextAlign.center),
                  ],
                ),
                color: Colors.teal[100],
              ),
              onTap: () => {
                // Navigation to NumericValueConverterPage.
                navigateToNumericValueConverterPage()
              },
            ),
          ),

          // Tile "Area Converter Page"
          GridTile(
            child: InkResponse(
              enableFeedback: true,
              child: Container(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: <Widget>[
                    Icon(Icons.rounded_corner_sharp),
                    Text("Aire", textAlign: TextAlign.center),
                  ],
                ),
                color: Colors.teal[500],
              ),
              onTap: () => {
                // Navigation to AreaConverterPage.
                navigateToAreaConverterPage()
              },
            ),
          ),

          // Tile "Degree Converter Page
          GridTile(
            child: InkResponse(
              enableFeedback: true,
              child: Container(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: <Widget>[
                    Icon(Icons.local_fire_department),
                    Text("Températures", textAlign: TextAlign.center),
                  ],
                ),
                color: Colors.teal[100],
              ),
              onTap: () => {
                // Navigation to DegreeConverterPage.
                navigateToDegreeConverterPage()
              },
            )
          ),

          // Tile "Roman Converter Page"
          GridTile(
            child: InkResponse(
              enableFeedback: true,
              child: Container(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: <Widget>[
                    Icon(Icons.account_balance),
                    Text("Décimaux VS Romains", textAlign: TextAlign.center),
                  ],
                ),
                color: Colors.teal[500],
              ),
              onTap: () => {
                // Navigation to RomanConverterPage.
                navigateToRomanConverterPage()
              },
            )
          ),

        ],
      ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
