import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:octo_status/IncidentPage.dart';
import 'package:octo_status/SchedulePage.dart';
import 'package:octo_status/SummaryPage.dart';
import 'package:octo_status/WebPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Github Status',
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(key:UniqueKey(),title: 'GitHub Status'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({required Key key, required this.title}) : super(key: key);


  final String title;

  int selectedIndex = 0;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
        centerTitle: true,
        elevation: 5,
      ),
      body:
        Row(
          children: [
            NavigationRail(
              labelType: NavigationRailLabelType.all,
              selectedIndex:widget.selectedIndex,
              destinations: [
              NavigationRailDestination(icon:Icon(LineIcons.thermometerFull),selectedIcon: Icon(LineIcons.thermometerFull,color: Theme.of(context).indicatorColor,),
                  label: Text("Components")),
              NavigationRailDestination(icon:Icon(LineIcons.carCrash),selectedIcon: Icon(LineIcons.carCrash,color: Theme.of(context).indicatorColor,),label: Text("Incidents")),
              NavigationRailDestination(icon:Icon(LineIcons.dizzyFaceAlt),selectedIcon: Icon(LineIcons.dizzyFaceAlt,color: Theme.of(context).indicatorColor,),label: Text("Maintenance")),
            ],
              onDestinationSelected: (int index){
                setState(() {
                  widget.selectedIndex = index;
                });

              },


            ),
            VerticalDivider(thickness: 1, width: 1),
            Expanded(child: masterWidget(widget.selectedIndex))
          ],
        ),

    );


  }
  Widget masterWidget(int selectedPos)
  {
    if(selectedPos==0)
    {
      return SummaryPage();
    }else if(selectedPos ==1)
      {
        return IncidentPage(key: UniqueKey());
      }else if(selectedPos==2)
        {
          return SchedulePage(key: UniqueKey());
        }else return SummaryPage();
  }


}
