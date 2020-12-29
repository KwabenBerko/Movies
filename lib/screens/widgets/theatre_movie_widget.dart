import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_basics_2/models/models.dart';
import 'package:flutter_bloc_basics_2/screens/widgets/movie_ratings_widget.dart';
import 'package:flutter_bloc_basics_2/screens/widgets/movie_title_widget.dart';

class TheatreMovie extends StatelessWidget {
  final Movie _movie;
  final Function _onMovieClicked;

  const TheatreMovie({
    Key key,
    @required Movie movie,
    @required Function onMovieClicked,
  })  : _movie = movie,
        _onMovieClicked = onMovieClicked,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _onMovieClicked(_movie);
      },
      child: Container(
        padding: EdgeInsets.only(right: 20.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: InkWell(
            child: Container(
              width: 130.0,
              decoration: BoxDecoration(color: Colors.transparent),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    child: CachedNetworkImage(
                      imageUrl: "${_movie.posterUrl}",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8.0,
                      left: 5.0,
                      right: 5.0,
                      bottom: 5.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MovieTitle(
                          movieTitle: _movie.title,
                          releaseDate: _movie.releaseDate,
                          fontSize: 14.0,
                          maxLines: 1,
                        ),
                        const SizedBox(height: 3.0),
                        MovieRatings(ratings: _movie.rating)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
