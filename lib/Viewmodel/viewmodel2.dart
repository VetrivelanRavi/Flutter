import 'dart:convert';
import 'package:home_sale_app/Model/model2.dart';
import 'package:home_sale_app/link.dart';
import 'package:http/http.dart' as http;


class ViewModel2 {
  Future<Property> fetchDetails() async {
    final response =
        await http.get(Uri.parse(ApiCall.baseUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      return Property.fromJson(responseData);
    } else {
      throw Exception('Failed to load details');
    }
  }
}
