import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../Model/model.dart';
import 'package:flutter_test/flutter_test.dart';


class ViewModelClass {
  ViewModelClass();

  Future<List<ModelClass>> fetchModel() async {
    try {
      
      String jsonString = await rootBundle.loadString('assets/jsonfile.json');

      
      List<dynamic> jsonData = jsonDecode(jsonString);

      
      List<ModelClass> model = jsonData.map((dynamic item) => ModelClass.fromJson(item)).toList();

      return model
      ;
    } catch (e) {
      throw Exception('Failed to load Screen: $e');
    }
  }
}
