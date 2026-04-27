import 'package:flutter/material.dart';
import 'package:modul6_http_requst2/models/ToDo.dart';

class MovieDetail extends StatelessWidget {
  final ToDo movie;

  MovieDetail(this.movie);

  @override
  Widget build(BuildContext context) {
    String path;
    if (movie.id != null) {
      path = 'https://picsum.photos/id/${movie.id}/500/500';
    } else {
      path = 'https://images.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg';
    }

    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title!),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar full width
            SizedBox(
              width: double.infinity,
              height: height / 2.5,
              child: Image.network(path, fit: BoxFit.cover),
            ),

            // Card info
            Padding(
              padding: EdgeInsets.all(16),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(
                        movie.title!,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(),

                      // ID
                      Row(
                        children: [
                          Icon(Icons.tag, color: Colors.deepPurple),
                          SizedBox(width: 8),
                          Text('ID: ${movie.id}', style: TextStyle(fontSize: 16)),
                        ],
                      ),
                      SizedBox(height: 8),

                      // User ID
                      Row(
                        children: [
                          Icon(Icons.person, color: Colors.deepPurple),
                          SizedBox(width: 8),
                          Text('User ID: ${movie.userId}', style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}