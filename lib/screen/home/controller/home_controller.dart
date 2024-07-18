import 'dart:async';
import 'dart:ui';
import 'package:dbminer/screen/home/model/home_model.dart';
import 'package:dbminer/utils/helper/db_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../utils/helper/json_helper.dart';

class QuotesController extends GetxController {
  RxList<Map> readData = <Map>[].obs;
  List<Map> searchList = <Map>[];
  List<Map> copyList = <Map>[];

 RxList<HomeModel> quote=<HomeModel>[].obs;
  RxInt changeNavIndex=0.obs;
  RxList<Color> changecolor = [Colors.black, Colors.white, ...Colors.primaries].obs;
  RxList<Color> changebg = [Colors.black, Colors.white, ...Colors.accents].obs;

  static DbHelper helper=DbHelper();
  JsonHelper jsonHelper = JsonHelper();

  Future<void> getReadData() async {
    readData.value = await helper.readQuote();
    copyList = List.from(readData);
  }

  Future<void> updateQuote(String text, int id) async {
    await helper.updateQuote(text, id);
    getReadData();
  }

  Future<void> deleteQuote(int id) async {
    await helper.deleteQuote(id);
    getReadData();
  }

  Future<void> insertQuotes(String text,String author) async {
    await helper.insertQuotes(text,author);
    getReadData();
  }

  void changeIndex(int index)
  {
    changeNavIndex.value=index;
  }

  void changeBgColor()  {

  }

  Future<void> getquoteJsonData()
   async {

   List<HomeModel>? quoteList =await jsonHelper.quoteJson();
   quote.value=quoteList!;
  }

}