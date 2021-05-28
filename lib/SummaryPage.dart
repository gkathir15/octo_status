import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:octo_status/SummaryModel.dart';


class SummaryPage extends StatefulWidget {
  
   SummaryPage() : super();
   SummaryModel? summaryModel;

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
    widget.summaryModel = SummaryModel.fromJson(response.data);
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
      child: widget.summaryModel!=null?SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Components",style: TextStyle(fontSize: 40),),
            ),
            ListView.builder(itemBuilder: (BuildContext ctx,int index){
              return ListTile(leading: widget.summaryModel!.components![index].status=="operational"?Icon(LineIcon.smilingFaceAlt().icon):Icon(LineIcon.frowningFace().icon),
              subtitle: Text( widget.summaryModel!.components![index].description??""),
              title: Text( widget.summaryModel!.components![index].name??""),
              );
            },itemCount: widget.summaryModel!.components!.length,physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,),
          ],
        ),
      ):Center(child: CircularProgressIndicator.adaptive(),),		// scroll view
    );;
  }
}
