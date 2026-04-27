import 'package:flutter/material.dart';
import 'package:modul5_movie_app/service/http_service.dart';
import 'package:modul5_movie_app/models/movie.dart';
import 'package:modul5_movie_app/pages/movie_detail.dart';

class MovieList extends StatefulWidget {
  const MovieList({super.key});

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  int moviesCount = 0;
  List<Movie> movies = [];
  late HttpService service;

  Future initialize() async {
    movies = await service.getPopularMovies();

    setState(() {
      moviesCount = movies.length;
    });
  }

  @override
  void initState() {
    super.initState();
    service = HttpService();
    initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Popular Movies")),
      body: ListView.builder(
        itemCount: moviesCount,
        itemBuilder: (context, int position) {
          return Card(
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500/${movies[position].posterPath}',
                  width: 50,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(movies[position].title),
              subtitle: Text('Rating = ${movies[position].voteAverage}'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieDetail(movies[position]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
