import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:home_sale_app/Model/model2.dart';

class ViewModel2{
  ViewModel2();

  Future<List<Model2>> fetchModel2() async {
    try{
      String jsonString = await rootBundle.loadString('assets/jsonfile2.json');

      List<dynamic> jsonData =jsonDecode(jsonString);

      List<Model2> model2 =jsonData.map((dynamic item) => Model2.fromJson(item)).toList();

      return model2;
      }catch(e){
        throw Exception('Failed to load Screen: $e');
      }
  }
}