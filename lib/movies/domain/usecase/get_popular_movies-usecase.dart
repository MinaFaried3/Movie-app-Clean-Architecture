import 'package:movie_app_project/movies/domain/entities/movie.dart';
import 'package:movie_app_project/movies/domain/repository/base_movie_repository.dart';

class GetPopularMoviesUseCase {
  final BaseMoviesRepository baseMoviesRepository;

  GetPopularMoviesUseCase(this.baseMoviesRepository);

  Future<List<Movie>> execute() async {
    return await baseMoviesRepository.getPopularMovies();
  }
}
