import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:octo_status/SummaryModel.dart';

class SummaryPage extends StatefulWidget {
  
   SummaryPage({Key key}) : super(key: key);
   SummaryModel summaryModel;

  final String url = "https://kctbh9vrtdwd.statuspage.io/api/v2/summary.json";

  @override
  _SummaryPageState createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  
  @override
  void initState() {
    super.initState();

  }

  fetchSummary () async
  {
    Response response = await Dio().get(widget.url);
    setState(()  {
      widget.summaryModel = SummaryModel.fromJson(response.data);
    });

  }
  @override
  Widget build(BuildContext context) {

      fetchSummary();

    return LiquidPullToRefresh(
      key: UniqueKey(),	// key if you want to add
      onRefresh: () async{
        setState(() {
          fetchSummary();
                  });
      },	// refresh callback
      child: widget.summaryModel!=null?ListView(
        children: [
          Text("Components",style: TextStyle(fontSize: 40),),
          ListView.builder(itemBuilder: (BuildContext ctx,int index){
            return ListTile(leading: widget.summaryModel.components[index].status=="operational"?Icon(LineIcon.smilingFaceAlt().icon):Icon(LineIcon.frowningFace().icon),
            subtitle: Text( widget.summaryModel.components[index].description),
            title: Text( widget.summaryModel.components[index].name),
            );
          },itemCount: widget.summaryModel.components.length,shrinkWrap: true,),
          Divider(height: 2,thickness: 2,),
          widget.summaryModel.components.isNotEmpty?
             Column( children: [
              Text("Incidents", style: TextStyle(fontSize: 40),),
              ListView.builder(itemBuilder: (BuildContext ctx, int index) {
                return ListTile(
                  leading: widget.summaryModel.incidents[index].impact ==
                      "critical" ? Icon(LineIcon
                      .cryingFace()
                      .icon) : Icon(LineIcon
                      .frowningFace()
                      .icon),
                  subtitle: Text(
                      widget.summaryModel.incidents[index].incidentUpdates[0].body),
                  title: Text(widget.summaryModel.incidents[index].name),
                  trailing: Text("Status ${widget.summaryModel.incidents[index].incidentUpdates[0].status}"),
                );
              }, itemCount: widget.summaryModel.incidents.length,shrinkWrap: true,)
            ],):Divider(),
          widget.summaryModel.components.isNotEmpty?
          Column( children: [
            Text("Maintanence Schedule", style: TextStyle(fontSize: 40),),
            ListView.builder(itemBuilder: (BuildContext ctx, int index) {
              return ListTile(
                leading: widget.summaryModel.scheduledMaintenances[index].status ==
                    "none" ? Icon(LineIcon
                    .smilingFaceAlt()
                    .icon) : Icon(LineIcon
                    .frowningFace()
                    .icon),
                subtitle: Text(
                    widget.summaryModel.scheduledMaintenances[index].incidentUpdates[0].body),
                title: Text(widget.summaryModel.scheduledMaintenances[index].name),
                trailing: Text("Status ${widget.summaryModel.scheduledMaintenances[index].incidentUpdates[0].status}"),
              );
            }, itemCount: widget.summaryModel.components.length,shrinkWrap: true,)
          ],):Divider()




        ],
      ):Center(child: CircularProgressIndicator.adaptive(),),		// scroll view
    );;
  }
}
