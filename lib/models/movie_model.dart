import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_basics_2/models/models.dart';

class Movie extends Equatable {
  final String title;
  final double rating;
  final String posterUrl;
  final String trailerUrl;
  final int releaseDate;
  final String synopsis;
  final List<Actor> cast;
  final bool isTrending;

  Movie({
    @required this.title,
    @required this.rating,
    @required this.posterUrl,
    @required this.trailerUrl,
    @required this.releaseDate,
    @required this.synopsis,
    @required this.cast,
    this.isTrending = false,
  });

  @override
  List<Object> get props => [
        title,
        rating,
        posterUrl,
        trailerUrl,
        releaseDate,
        synopsis,
        cast,
      ];

  @override
  bool get stringify => true;

  String getFirstThreeCastMembers() {
    final result = StringBuffer();
    for (var i = 0; i < cast.sublist(0, 3).length; i++) {
      result.write(cast[i].name);
      if (i < 2) {
        result.write(", ");
      }
    }
    return result.toString();
  }
}
