part of 'movies_bloc.dart';

abstract class MoviesState extends Equatable {}

class Loading extends MoviesState {
  @override
  List<Object> get props => [];
}

class LoadedMovies extends MoviesState {
  final List<Movie> inThreatre;
  final List<Movie> trending;

  LoadedMovies({@required this.inThreatre, @required this.trending});

  @override
  List<Object> get props => [inThreatre, trending];
}
