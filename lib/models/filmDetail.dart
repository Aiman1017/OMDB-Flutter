class FilmDetail {
  final String imdbId;
  final String title;
  final String type;
  final String year;
  final String director;
  final String plot;
  final String actor;

  FilmDetail({this.imdbId, this.title, this.type, this.director, this.plot,
   this.actor, this.year});

   factory FilmDetail.fromJson(Map<String, dynamic>json){
     return FilmDetail(
      type: json["Type"],
      title:json["Title"],
      year: json['Year'],
      director: json["Director"],
      plot:json["Plot"],
      actor: json["Actors"]
     );
   }

}
