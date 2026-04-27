import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:modul6_http_requst2/models/ToDo.dart';

class HttpService {
  final String baseUrl = 'https://jsonplaceholder.typicode.com/todos';

  Future<List<ToDo>> getPopularMovies() async {
    final String uri = baseUrl;

    http.Response result = await http.get(
      Uri.parse(uri),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = jsonDecode(result.body);
      List<ToDo> movies = (jsonResponse as List)
          .map((i) => ToDo.fromJson(i))
          .cast<ToDo>()
          .toList();
      return movies;
    } else {
      print("Fail");
      List.empty();
      return List.empty();
    }
  }
}
