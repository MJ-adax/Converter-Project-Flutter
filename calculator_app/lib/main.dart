import 'package:calculator_app/animationsRoute/fadeRoute.dart';
import 'package:calculator_app/animationsRoute/rotationRoute.dart';
import 'package:calculator_app/animationsRoute/scaleRoute.dart';
import 'package:calculator_app/animationsRoute/sizeRoute.dart';
import 'package:calculator_app/animationsRoute/slideDownRoute.dart';
import 'package:calculator_app/animationsRoute/slideLeftRoute.dart';
import 'package:calculator_app/animationsRoute/slideRightRoute.dart';
import 'package:calculator_app/animationsRoute/slideTopRoute.dart';
import 'package:calculator_app/models/navigationItems.dart';
import 'package:calculator_app/utilitaires/ageCalculator.dart';
import 'package:calculator_app/utilitaires/areaConverter.dart';
import 'package:calculator_app/utilitaires/computerFileSizeConverter.dart';
import 'package:calculator_app/utilitaires/degreeConverter.dart';
import 'package:calculator_app/utilitaires/distanceConverter.dart';
import 'package:calculator_app/utilitaires/numericValueConverter.dart';
import 'package:calculator_app/utilitaires/romanConverter.dart';
import 'package:calculator_app/utilitaires/saleCalculator.dart';
import 'package:calculator_app/utilitaires/timesUpCalculator.dart';
import 'package:flutter/cupertino.dart';
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
      home: MyHomePage(title: 'Flutter Calculator'),
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

  String displayMode = "Grid";

  var navigation = [
    NavigationItem("Convertisseur de Fichiers Informatiques", Icon(Icons.file_copy_outlined), Colors.lightBlue),
    NavigationItem("Calculateur d'Age", Icon(Icons.calendar_today_sharp), Colors.lightBlue),
    NavigationItem("Calculateur de Promotions", Icon(Icons.add_shopping_cart), Colors.lightBlue),
    NavigationItem("Calculateur de Temps ??coul??", Icon(Icons.hourglass_bottom), Colors.lightBlue),
    NavigationItem("Convertisseur des Unit??s de distance", Icon(Icons.horizontal_rule), Colors.lightBlue),
    NavigationItem("Convertisseur des Valeurs num??riques", Icon(Icons.analytics_outlined), Colors.lightBlue),
    NavigationItem("Convertisseur des Aires", Icon(Icons.rounded_corner_sharp), Colors.lightBlue),
    NavigationItem("Convertisseur des Temp??ratures", Icon(Icons.local_fire_department), Colors.lightBlue),
    NavigationItem("Convertisseur des Chiffres romains", Icon(Icons.account_balance), Colors.lightBlue)
  ];

  void navigateToChosenDestination (String chosenDestination) {
    switch(chosenDestination){
      case "Convertisseur de Fichiers Informatiques":
        Navigator.push(context, FadeRoute(page: ComputerFileSizeConverterPage(title: chosenDestination)));
        break;
      case "Calculateur d'Age":
        Navigator.push(context, SlideDownRoute(page: AgeCalculatorPage(title: chosenDestination)));
        break;
      case "Calculateur de Promotions":
        Navigator.push(context, RotationRoute(page: SaleCalculatorPage(title: chosenDestination)));
        break;
      case "Calculateur de Temps ??coul??":
        Navigator.push(context, SlideRightRoute(page: TimesUpCalculatorPage(title: chosenDestination)));
        break;
      case "Convertisseur des Unit??s de distance":
        Navigator.push(context, SizeRoute(page: DistanceConverterPage(title: chosenDestination)));
        break;
      case "Convertisseur des Valeurs num??riques":
        Navigator.push(context, SlideLeftRoute(page: NumericValueConverterPage(title: chosenDestination)));
        break;
      case "Convertisseur des Aires":
        Navigator.push(context, ScaleRoute(page: AreaConverterPage(title: chosenDestination)));
        break;
      case "Convertisseur des Temp??ratures":
        Navigator.push(context, SlideTopRoute(page: DegreeConverterPage(title: chosenDestination)));
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
      drawer: Drawer(
        child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget> [
              DrawerHeader(
                child: Text("Changer l'affichage"),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Grid'),
                onTap: () {
                  setState(() {
                    displayMode = "Grid";
                  });

                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('List'),
                onTap: () {
                  setState(() {
                    displayMode = "List";
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Card'),
                onTap: () {
                  setState(() {
                    displayMode = "Cards";
                  });

                  Navigator.pop(context);
                },
              ),
            ]
        )
      ),
      body:
        displayMode == "Grid" ?
        GridView.builder(
          padding: const EdgeInsets.all(10),
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
                        Text(
                            "${navigation[index].title}",
                            textAlign: TextAlign.center,
                            style: TextStyle(height: 3, fontSize: 20),
                        ),
                      ],
                    ),
                    color: index.remainder(2) == 0 ? Colors.teal[500] : Colors.teal[100]

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
        : displayMode == "List" ?
        ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: navigation.length,
          itemBuilder: (context, index) {
          return ListTile(
            leading: navigation[index].icon,
            title: Text("${navigation[index].title}", textAlign: TextAlign.center),
            tileColor: index.remainder(2) == 0 ? Colors.teal[500] : Colors.teal[100],
            onTap: () => {
              // Navigation to ComputerFileSizeConverterPage.
              navigateToChosenDestination(navigation[index].title)
            },
          );
        })
        :  ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: navigation.length,
            itemBuilder: (context, index) {
              return Container(
                width: 150,
                height: 200,
                child: InkResponse(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: index.remainder(2) == 0 ? Colors.teal[500] : Colors.teal[100],
                    elevation: 10,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: navigation[index].icon,
                          title: Text(
                            "${navigation[index].title}",
                            textAlign: TextAlign.center,
                            style: TextStyle(height: 5, fontSize: 25),
                          ),
                          //tileColor: index.remainder(2) == 0 ? Colors.teal[500] : Colors.teal[100],

                        ),
                      ],
                    ),
                  ),
                  onTap: () => {
                  // Navigation to ComputerFileSizeConverterPage.
                  navigateToChosenDestination(navigation[index].title)
                  },
                )
              );
            })

    );
  }
}
