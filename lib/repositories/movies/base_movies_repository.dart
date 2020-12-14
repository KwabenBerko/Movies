import 'package:flutter_bloc_basics_2/models/models.dart';
import 'package:flutter_bloc_basics_2/repositories/repositories.dart';

abstract class BaseMoviesRepository extends BaseRepository {
  Stream<List<Movie>> streamMovies();
}
