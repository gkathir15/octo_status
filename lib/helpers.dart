import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:octo_status/WebPage.dart';

import 'DioPerf.dart';





  getDio(){
    final dio = Dio();
    final performanceInterceptor = DioFirebasePerformanceInterceptor();
    dio.interceptors.add(performanceInterceptor);
    return dio;
  }


void openWebpage(BuildContext context,String url) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => WebPage(url)),
  );
}