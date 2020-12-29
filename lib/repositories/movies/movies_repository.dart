import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc_basics_2/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc_basics_2/repositories/movies/base_movies_repository.dart';

class MoviesRepository extends BaseMoviesRepository {
  final http.Client _httpClient;

  MoviesRepository({@required http.Client httpClient})
      : _httpClient = httpClient;

  @override
  void dispose() {
    _httpClient.close();
  }

  @override
  Stream<List<Movie>> streamMovies() async* {
    final response = await _httpClient.get("https://jsonkeeper.com/b/UQ09");
    if (response.statusCode != 200) {
      yield* Stream.empty();
    } else {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List<Movie> movies = (data["movies"] as List).map((movie) {
        return Movie(
            title: movie["title"],
            rating: movie["rating"] is int
                ? (movie["rating"] as int).toDouble()
                : movie["rating"],
            posterUrl: movie["poster_url"],
            trailerUrl: movie["trailer_url"],
            releaseDate: movie["release_date"],
            synopsis: movie["synopsis"],
            comments: (movie["comments"] as List).map((comment) {
              final commenter = comment["commenter"];
              return Comment(
                commenter: Commenter(
                  name: commenter["name"],
                  imageUrl: commenter["image_url"],
                ),
                text: comment["text"],
                createdAt:
                    DateTime.fromMillisecondsSinceEpoch(comment["created_at"]),
              );
            }).toList(),
            cast: (movie["cast"] as List)
                .map((actor) => Actor(name: actor["name"]))
                .toList(),
            isTrending: movie["is_trending"]);
      }).toList();

      yield* Stream.value(movies);
    }
  }
}
