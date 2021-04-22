import 'package:calculator_app/navigationItems.dart';
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

  var navigation = [
    NavigationItem("Convertisseur de Fichiers Informatiques", Icon(Icons.folder), Colors.lightBlue),
    NavigationItem("Calculateur d'Age", Icon(Icons.folder), Colors.lightBlue),
    NavigationItem("Calculateur de Promotions", Icon(Icons.folder), Colors.lightBlue),
    NavigationItem("Calculateur de Temps écoulé", Icon(Icons.folder), Colors.lightBlue),
    NavigationItem("Convertisseur des Unités de distance", Icon(Icons.folder), Colors.lightBlue),
    NavigationItem("Convertisseur des Valeurs numériques", Icon(Icons.folder), Colors.lightBlue),
    NavigationItem("Convertisseur des Aires", Icon(Icons.folder), Colors.lightBlue),
    NavigationItem("Convertisseur des Températures", Icon(Icons.folder), Colors.lightBlue),
    NavigationItem("Convertisseur des Chiffres romains", Icon(Icons.folder), Colors.lightBlue)
  ];

  void navigateToChosenDestination (String chosenDestination) {
    switch(chosenDestination){
      case "Convertisseur de Fichiers Informatiques":
        Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
          return new ComputerFileSizeConverterPage(
              title: chosenDestination
          );
        }));
        break;
      case "Calculateur d'Age":
        Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
          return new AgeCalculatorPage(
              title: chosenDestination
          );
        }));
        break;
      case "Calculateur de Promotions":
        Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
          return new SaleCalculatorPage(
              title: chosenDestination
          );
        }));
        break;
      case "Calculateur de Temps écoulé":
        Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
          return new TimesUpCalculatorPage(
              title: chosenDestination
          );
        }));
        break;
      case "Convertisseur des Unités de distance":
        Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
          return new DistanceConverterPage(
              title: chosenDestination
          );
        }));
        break;
      case "Convertisseur des Valeurs numériques":
        Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
          return new NumericValueConverterPage(
              title: chosenDestination
          );
        }));
        break;
      case "Convertisseur des Aires":
        Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
          return new AreaConverterPage(
              title: chosenDestination
          );
        }));
        break;
      case "Convertisseur des Températures":
        Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
          return new DegreeConverterPage(
              title: chosenDestination
          );
        }));
        break;
      case "Convertisseur des Chiffres romains":
        Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
          return new RomanConverterPage(
              title: chosenDestination
          );
        }));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),

      ),
      body: GridView.builder(
          itemCount: navigation.length,
          itemBuilder: (context, index) {
            return GridTile(
                child: InkResponse(
                  enableFeedback: true,
                  focusColor: navigation[index].color,
                  child: Container(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      children: <Widget>[
                        navigation[index].icon,
                        Text("${navigation[index].title}", textAlign: TextAlign.center),
                      ],
                    ),
                    color: Colors.teal[500],
                  ),
                  onTap: () => {
                    // Navigation to ComputerFileSizeConverterPage.
                    navigateToChosenDestination(navigation[index].title)
                  },
                )
            );
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.of(context).orientation ==
                Orientation.landscape ? 3: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: (2 / 1),
          )
      )
    );
  }
}
