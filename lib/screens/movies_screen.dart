import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_basics_2/bloc/bloc.dart';
import 'package:flutter_bloc_basics_2/models/models.dart';
import 'package:flutter_bloc_basics_2/models/movie_model.dart';
import 'package:flutter_bloc_basics_2/screens/screens.dart';
import 'package:flutter_bloc_basics_2/screens/widgets/theatre_movie_widget.dart';
import 'package:flutter_bloc_basics_2/screens/widgets/trending_movie_widget.dart';

class MoviesScreen extends StatelessWidget {
  static const String routeName = "/";

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
                          return TheatreMovie(
                              movie: state.inThreatre[index],
                              onMovieClicked: (Movie movie) {
                                Navigator.of(context).pushNamed(
                                    MovieDetailsScreen.routeName,
                                    arguments: movie);
                              });
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
                            return TrendingMovie(
                              movie: state.trending[index],
                              onMovieClicked: (Movie movie) {
                                Navigator.of(context).pushNamed(
                                  MovieDetailsScreen.routeName,
                                  arguments: movie,
                                );
                              },
                            );
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
