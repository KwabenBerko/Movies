import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_basics_2/bloc/bloc.dart';
import 'package:flutter_bloc_basics_2/models/models.dart';
import 'package:flutter_bloc_basics_2/models/movie_model.dart';

class MoviesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 28.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 22.0, right: 22.0),
                child: TextField(
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                  decoration: InputDecoration(
                      isDense: true,
                      hintText: "Search",
                      hintStyle: const TextStyle(
                        color: Color(0xFFC4C4C4),
                        fontWeight: FontWeight.w600,
                      ),
                      suffixIcon: const Icon(
                        Icons.search_rounded,
                        color: Colors.white70,
                        size: 24,
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      contentPadding: const EdgeInsets.only(
                        left: 15,
                        right: 15,
                        top: 12,
                        bottom: 12,
                      ),
                      filled: true,
                      fillColor: Color(0xFF2B2B2B)),
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 22.0, right: 22.0),
                child: Row(
                  children: [
                    Text(
                      "In theatre",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              Container(
                height: 240,
                child: state is LoadedMovies
                    ? ListView.builder(
                        padding: EdgeInsets.only(top: 12.0, left: 20.0),
                        itemCount: state.inThreatre.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext content, int index) {
                          final movie = state.inThreatre[index];
                          return buildMovieInTheatre(context, movie);
                        },
                      )
                    : SizedBox.shrink(),
              ),
              SizedBox(
                height: 18,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 22.0, right: 22.0),
                child: Row(
                  children: [
                    Text(
                      "Trending",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 22.0, right: 22.0),
                  child: state is LoadedMovies
                      ? ListView.builder(
                          itemCount: state.trending.length,
                          scrollDirection: Axis.vertical,
                          padding: EdgeInsets.zero,
                          itemBuilder: (BuildContext context, int index) {
                            return buildTrendingMovie(
                                context, state.trending[index]);
                          },
                        )
                      : SizedBox.shrink(),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

buildTrendingMovie(BuildContext context, Movie movie) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20.0),
    child: Container(
      height: 100.0,
      color: Colors.transparent,
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                decoration: const BoxDecoration(color: Colors.transparent),
                width: 75,
                child: CachedNetworkImage(
                  imageUrl: "${movie.posterUrl}",
                  fit: BoxFit.cover,
                ),
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
                  Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(
                          movie.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          width: 3.0,
                        ),
                        Text(
                          "(${movie.releaseDate})",
                          style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey,
                              fontWeight: FontWeight.w600),
                        ),
                      ]),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star_rounded,
                        color: Color(0xFFEBCD72),
                        size: 17.0,
                      ),
                      SizedBox(
                        width: 2.0,
                      ),
                      Text(
                        "${movie.rating}",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    getFirstThreeCastMembers(movie.cast),
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
  );
}

String getFirstThreeCastMembers(List<Actor> cast) {
  final result = StringBuffer();
  for (var i = 0; i < cast.sublist(0, 3).length; i++) {
    result.write(cast[i].name);
    if (i < 2) {
      result.write(", ");
    }
  }
  return result.toString();
}

buildMovieInTheatre(BuildContext context, Movie movie) {
  return GestureDetector(
    onTap: () {
      print("Movie With Title ${movie.title} Clicked!");
      Navigator.of(context).pushNamed("/details");
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
                    imageUrl: "${movie.posterUrl}",
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
                      Row(
                        children: [
                          Text(
                            movie.title,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            width: 3.0,
                          ),
                          Text(
                            "(${movie.releaseDate})",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12.0,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                      const SizedBox(height: 3.0),
                      Row(
                        children: [
                          Icon(
                            Icons.star_rounded,
                            color: Color(0xFFEBCD72),
                            size: 18.0,
                          ),
                          SizedBox(
                            width: 2.0,
                          ),
                          Text(
                            "${movie.rating}",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13.0,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      )
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
