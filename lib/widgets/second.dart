import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:omdb_api_flutter_2/models/filmDetail.dart';

class Detail extends StatefulWidget {
  final String imdbID;
  Detail({this.imdbID});
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  FilmDetail currentFilm;

  @override
  void initState() {
    fetchFilms().then((films){
        setState(() {
          currentFilm = films;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('This is a detail page')
      ),

      body: Container(
        child:

        currentFilm == null ? Center(child: CircularProgressIndicator()) :

        Column(children: <Widget>[
          Text(currentFilm.title),
          Text(currentFilm.type),
          Text(currentFilm.year),
          Text(currentFilm.director),
          Text(currentFilm.plot),
          Text(currentFilm.actor)
        ],)
      )
    );
  }

  Future <FilmDetail> fetchFilms() async {
    //The API will call whatever the search bar 'Title' is enter
    final response =  await http.get('http://www.omdbapi.com/?s=${widget.imdbID}&apikey=87d10179');
    if (response.statusCode == 200) {
      print(response.body);
      // Transform json into object
      return FilmDetail.fromJson(json.decode(response.body));
      
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}