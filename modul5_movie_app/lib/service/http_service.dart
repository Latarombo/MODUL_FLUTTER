import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:modul5_movie_app/models/movie.dart';

class HttpService {
  final String apiKey = '98fe86ef49d2e08e532bf1168babbe9a';
  final String baseUrl = 'https://api.themoviedb.org/3/movie/popular?api_key=';

  Future<List<Movie>> getPopularMovies() async {
    final String uri = baseUrl + apiKey;
    http.Response result = await http.get(Uri.parse(uri));

    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];

      List<Movie> movies = moviesMap
          .map<Movie>((i) => Movie.fromJson(i))
          .toList();

      return movies;
    } else {
      throw Exception("Gagal mengambil data");
    }
  }
}
