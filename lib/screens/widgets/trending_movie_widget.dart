import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_basics_2/models/models.dart';
import 'package:flutter_bloc_basics_2/screens/widgets/movie_poster_widget.dart';
import 'package:flutter_bloc_basics_2/screens/widgets/movie_ratings_widget.dart';
import 'package:flutter_bloc_basics_2/screens/widgets/movie_title_widget.dart';
import '../screens.dart';

class TrendingMovie extends StatelessWidget {
  final Movie _movie;
  final Function _onMovieClicked;

  const TrendingMovie({
    Key key,
    @required Movie movie,
    @required Function onMovieClicked,
  })  : _movie = movie,
        _onMovieClicked = onMovieClicked,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onMovieClicked(_movie),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Container(
          height: 100.0,
          color: Colors.transparent,
          child: Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 75.0,
                  child: MoviePoster(
                    imageUrl: _movie.posterUrl,
                  ),
                ),
                SizedBox(
                  width: 12.0,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MovieTitle(
                        movieTitle: _movie.title,
                        releaseDate: _movie.releaseDate,
                        fontSize: 15.0,
                        maxLines: 2,
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      MovieRatings(ratings: _movie.rating),
                      const SizedBox(
                        height: 4.0,
                      ),
                      Text(
                        _movie.getFirstThreeCastMembers(),
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
