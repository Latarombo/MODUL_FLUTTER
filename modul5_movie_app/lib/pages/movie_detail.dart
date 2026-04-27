import 'package:flutter/material.dart';
import 'package:modul5_movie_app/models/movie.dart';
import 'dart:ui';

class MovieDetail extends StatelessWidget {
  final Movie movie;
  final String imgPath = 'https://image.tmdb.org/t/p/w500/';

  MovieDetail(this.movie);

  @override
  Widget build(BuildContext context) {
    String path = imgPath + movie.posterPath;

    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: Stack(
        children: [
          // Background
          SizedBox.expand(child: Image.network(path, fit: BoxFit.cover)),

          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(color: Colors.black.withOpacity(0.5)),
          ),

          // Konten
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 40),

                // Poster
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(path, height: 300),
                ),

                SizedBox(height: 16),

                // Judul
                Text(
                  movie.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 8),

                // Rating
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star, color: Colors.amber),
                    SizedBox(width: 5),
                    Text(
                      movie.voteAverage.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),

                SizedBox(height: 16),

                // Overview
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    movie.overview,
                    style: TextStyle(color: Colors.white, height: 1.5),
                  ),
                ),

                SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
