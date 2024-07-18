import 'dart:convert';

import 'package:dbminer/screen/home/model/home_model.dart';
import 'package:flutter/services.dart';

class JsonHelper {
  Future<List<HomeModel>?> quoteJson() async {
    String? quoteString = await rootBundle.loadString("assets/json/quotejson.json");
    List<dynamic> quoteList = jsonDecode(quoteString);

    List<HomeModel> quoteData =
        quoteList.map((e) => HomeModel.mapToModel(e)).toList();

    return quoteData;
  }
}
