import 'dart:convert';
import 'package:home_sale_app/Model/model2.dart';
import 'package:http/http.dart' as http;

class ViewModel2 {
  Future<Property> fetchDetails() async {
    final response =
        await http.get(Uri.parse('https://pastebin.com/raw/uj6vtukE'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      return Property.fromJson(responseData);
    } else {
      throw Exception('Failed to load details');
    }
  }
}
