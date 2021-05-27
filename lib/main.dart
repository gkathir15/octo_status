import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:octo_status/SummaryPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Github Status',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'GitHub Status'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


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
                  label: Text("Status")),
              NavigationRailDestination(icon:Icon(LineIcons.book),selectedIcon: Icon(LineIcons.book,color: Theme.of(context).indicatorColor,),label: Text("Summary")),
              NavigationRailDestination(icon:Icon(LineIcons.frowningFaceWithOpenMouth),selectedIcon: Icon(LineIcons.frowningFaceWithOpenMouth,color: Theme.of(context).indicatorColor,),label: Text("Incidents")),
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
    if(true)
    {
      return SummaryPage();
    }
  }
}
