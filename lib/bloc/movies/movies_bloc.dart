import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_basics_2/models/models.dart';
import 'package:flutter_bloc_basics_2/repositories/repositories.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final MoviesRepository _moviesRepository;

  MoviesBloc({@required MoviesRepository moviesRepository})
      : _moviesRepository = moviesRepository,
        super(LoadedMovies(inThreatre: [], trending: []));

  @override
  Stream<MoviesState> mapEventToState(
    MoviesEvent event,
  ) async* {
    if (event is GetMovies) {
      yield Loading();

      await for (List<Movie> movies in _moviesRepository.streamMovies()) {
        yield LoadedMovies(
          inThreatre: movies.where((movie) => !movie.isTrending).toList(),
          trending: movies.where((movie) => movie.isTrending).toList(),
        );
      }
    }
  }
}
