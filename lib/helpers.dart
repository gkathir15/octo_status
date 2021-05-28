import 'package:flutter/material.dart';
import 'package:octo_status/WebPage.dart';

void openWebpage(BuildContext context,String url)
{
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => WebPage(url)),
  );
}