import 'package:flutter/material.dart';
import 'package:modul6_http_requst2/models/ToDo.dart';
import 'package:modul6_http_requst2/service/http_service.dart';
import 'package:modul6_http_requst2/pages/movie_detail.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  int movieCount = 0;
  late List<ToDo> Movies;
  late HttpService service;

  Future initialize() async {
    Movies = [];
    Movies = await service.getPopularMovies();
    print(Movies);
    setState(() {
      movieCount = Movies.length;
      Movies = Movies;
    });
  }

  @override
  void initState() {
    service = HttpService();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Anjay Mabar")),
      body: ListView.builder(
        itemCount: movieCount,
        itemBuilder: (context, int position) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: Image.network(
                // tambah ini
                'https://picsum.photos/id/${Movies[position].id}/50/50',
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(Movies[position].id.toString()),
              subtitle: Text('Pro = ' + Movies[position].title!),

              onTap: () {
                MaterialPageRoute route = MaterialPageRoute(
                  builder: (_) => MovieDetail(Movies[position]),
                );
                Navigator.push(context, route);
              },
            ),
          );
        },
      ),
    );
  }
}
