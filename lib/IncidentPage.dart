import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:octo_status/IncidentModel.dart';
import 'package:octo_status/helpers.dart';

class IncidentPage extends StatefulWidget {
   IncidentPage({required Key key}) : super(key: key);
  final String url = "https://kctbh9vrtdwd.statuspage.io/api/v2/incidents.json";
  IncidentModel? incidentsModel;
  @override
  _IncidentPageState createState() => _IncidentPageState();
}

class Maintenences {
}

class _IncidentPageState extends State<IncidentPage> {
  fetchSummary () async
  {
    Response response = await Dio().get(widget.url);
    widget.incidentsModel = IncidentModel.fromJson(response.data);
    if(mounted) {
      setState(() {

      });
    }

  }
  @override
  Widget build(BuildContext context) {

    fetchSummary();

    return LiquidPullToRefresh(
      key: UniqueKey(),	// key if you want to add
      onRefresh: () async{
        fetchSummary();
      },	// refresh callback
      child: widget.incidentsModel!=null?SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            Container(child: Text("Incidents",style: TextStyle(fontSize: 40),)),
            ListView.builder(itemBuilder: (BuildContext ctx,int index){
              return ListTile(leading: widget.incidentsModel!.incidents![index].status=="resolved"?Icon(LineIcon.smilingFaceAlt().icon):Icon(LineIcon.frowningFace().icon),
                subtitle: Text( widget.incidentsModel!.incidents![index].incidentUpdates![0].body??""),
                title: Text( widget.incidentsModel!.incidents![index].name??""),
                onTap: (){
                  openWebpage(context,widget.incidentsModel!.incidents![index].shortlink??"");
                },
              );
            },itemCount: widget.incidentsModel!.incidents!.length,physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,),
          ],
        ),
      ):Center(child: CircularProgressIndicator.adaptive(),),		// scroll view
    );;
  }
}
