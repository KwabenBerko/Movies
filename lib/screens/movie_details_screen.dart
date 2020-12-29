import 'package:flutter/material.dart';
import 'package:flutter_bloc_basics_2/models/models.dart';
import 'package:flutter_bloc_basics_2/screens/widgets/movie_poster_widget.dart';
import 'package:flutter_bloc_basics_2/screens/widgets/movie_ratings_widget.dart';
import 'package:flutter_bloc_basics_2/screens/widgets/movie_title_widget.dart';

class MovieDetailsScreen extends StatelessWidget {
  static const String routeName = "/detail";

  final Movie _movie;

  const MovieDetailsScreen({Key key, @required Movie movie})
      : _movie = movie,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: _movie == null
            ? const SizedBox.shrink()
            : SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.fromLTRB(12.0, 28.0, 12.0, 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 130.0,
                            height: 170.0,
                            child: MoviePoster(
                              imageUrl: _movie.posterUrl,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MovieTitle(
                                    movieTitle: _movie.title,
                                    releaseDate: _movie.releaseDate,
                                    fontSize: 15.0,
                                    maxLines: 2,
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    _movie.getFirstThreeCastMembers(),
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 11.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    _movie.synopsis,
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  MovieRatings(ratings: _movie.rating)
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 18.0,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          width: double.infinity,
                          height: 50.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFFFF0000).withAlpha(100),
                                  blurRadius: 8.0,
                                  spreadRadius: 4.0,
                                )
                              ]),
                          child: FlatButton(
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            color: const Color(0xFFEC1F41),
                            child: Text(
                              "Add to watch list",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Text(
                        "Watch trailer",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 17.0,
                        ),
                      ),
                      const SizedBox(
                        height: 3.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  "https://img.youtube.com/vi/${_getVideoId(_movie.trailerUrl)}/maxresdefault.jpg",
                                ),
                              ),
                            ),
                            height: 200.0,
                            child: Center(
                              child: CircleAvatar(
                                backgroundColor: Color(0xE6AAAAAA),
                                radius: 22.0,
                                child: Icon(
                                  Icons.play_arrow_rounded,
                                  color: Colors.white,
                                  size: 35.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ));
  }

  String _getVideoId(String youtubeUrl) {
    final uri = Uri.parse(youtubeUrl);
    return uri == null ? null : uri.queryParameters["v"];
  }
}
