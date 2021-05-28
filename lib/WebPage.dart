import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends StatefulWidget {
  String? url;
  String failurl = "https://www.githubstatus.com/";

  WebPage(this.url);

  @override
  webpageState createState() => webpageState();
}

class webpageState extends State<WebPage> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    if(widget.url==null||widget.url!.isEmpty||widget.url==" ")
      {
        widget.url = widget.failurl;
      }
    return WebView(
      initialUrl: widget.url,
    );
  }
}
