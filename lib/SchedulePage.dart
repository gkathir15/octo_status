import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:octo_status/Maintenances.dart';
import 'package:octo_status/helpers.dart';

class SchedulePage extends StatefulWidget {
   SchedulePage({required Key key}) : super(key: key);
  final String url = "https://kctbh9vrtdwd.statuspage.io/api/v2/scheduled-maintenances.json";
  Maintenances? schedules;
  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  fetchSummary () async
  {
    Response response = await getDio().get(widget.url);
    widget.schedules = Maintenances.fromJson(response.data);
    if(mounted) {
      setState(() {

      });
    }

  }
  @override
  Widget build(BuildContext context) {

    fetchSummary();
//Text("Scheduled Maintenances",style: TextStyle(fontSize: 25),),
    return widget.schedules!=null?ListView.builder(itemBuilder: (BuildContext ctx,int index){
      return ListTile(leading: widget.schedules!.scheduledMaintenances![index].status=="completed"?Icon(LineIcon.smilingFaceAlt().icon):Icon(LineIcon.frowningFace().icon),
        subtitle: Text( widget.schedules!.scheduledMaintenances![index].incidentUpdates![0].body??""),
        title: Text( widget.schedules!.scheduledMaintenances![index].name??""),
        onTap: (){
          openWebpage(context,  widget.schedules!.scheduledMaintenances![index].shortlink??"");
        },);
    },itemCount: widget.schedules!.scheduledMaintenances!.length,
      shrinkWrap: false,):Center(child: CircularProgressIndicator.adaptive(),);;
  }
}
