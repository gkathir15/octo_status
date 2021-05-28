import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
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
    Response response = await Dio().get(widget.url);
    widget.schedules = Maintenances.fromJson(response.data);
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
      child: widget.schedules!=null?SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Scheduled Maintenances",style: TextStyle(fontSize: 25),),
            ),
            ListView.builder(itemBuilder: (BuildContext ctx,int index){
              return ListTile(leading: widget.schedules!.scheduledMaintenances![index].status=="completed"?Icon(LineIcon.smilingFaceAlt().icon):Icon(LineIcon.frowningFace().icon),
                subtitle: Text( widget.schedules!.scheduledMaintenances![index].incidentUpdates![0].body??""),
                title: Text( widget.schedules!.scheduledMaintenances![index].name??""),
              onTap: (){
                openWebpage(context,  widget.schedules!.scheduledMaintenances![index].shortlink??"");
              },);
            },itemCount: widget.schedules!.scheduledMaintenances!.length,physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,),
          ],
        ),
      ):Center(child: CircularProgressIndicator.adaptive(),),		// scroll view
    );;
  }
}
