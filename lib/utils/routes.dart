import 'package:dbminer/screen/detail/view/detail_screen.dart';
import 'package:dbminer/screen/home/view/home_screen.dart';
import 'package:dbminer/screen/quoedetail/view/quoteDetail_screen.dart';
import 'package:flutter/material.dart';

Map<String,WidgetBuilder>app_routes={
  '/':(context)=>HomeScreen(),
  'detail':(context)=>DetailScreen(),
  'quote':(context)=>QuotedetailScreen(),
};