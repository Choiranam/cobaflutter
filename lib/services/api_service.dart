import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cobaflutter/models/country_model.dart';

class ApiService {
  final String baseUrl = 'https://restcountries.com/v3.1/all';

  Future<List<Country>> fetchCountries() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) {
        return Country(
          name: json['name']['common'],
          flag: json['flags']['png'],
          capital: json['capital']?.first ?? 'Unknown',
          languages: List<String>.from(json['languages']?.values ?? []),
        );
      }).toList();
    } else {
      throw Exception('Failed to load countries');
    }
  }
}
