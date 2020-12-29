import 'package:flutter/material.dart';
import 'package:flutter_bloc_basics_2/models/models.dart';
import 'package:flutter_bloc_basics_2/screens/widgets/movie_poster_widget.dart';
import 'package:flutter_bloc_basics_2/screens/widgets/movie_ratings_widget.dart';
import 'package:flutter_bloc_basics_2/screens/widgets/movie_title_widget.dart';

class MovieDetailsScreen extends StatelessWidget {
  static const String routeName = "/movieDetail";

  final Movie _movie;

  const MovieDetailsScreen({Key key, @required Movie movie})
      : _movie = movie,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: _movie == null
            ? SizedBox.shrink()
            : Container(
                padding: EdgeInsets.fromLTRB(12.0, 28.0, 12.0, 0.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 130.0,
                          height: 180.0,
                          child: MoviePoster(
                            imageUrl: _movie.posterUrl,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MovieTitle(
                                  movieTitle: _movie.title,
                                  releaseDate: _movie.releaseDate,
                                  fontSize: 15.0,
                                  maxLines: 2,
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  _movie.getFirstThreeCastMembers(),
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 11.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
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
                                SizedBox(
                                  height: 5.0,
                                ),
                                MovieRatings(ratings: _movie.rating)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 18.0,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      width: double.infinity,
                      height: 50.0,
                      child: FlatButton(
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        color: Color(0xFFEC1F41),
                        child: Text(
                          "Add to watch list",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ));
  }
}
