import 'package:dartz/dartz.dart';
import 'package:movie_app_project/movies/domain/entities/movie.dart';
import 'package:movie_app_project/movies/domain/entities/recommendation.dart';
import 'package:movie_app_project/movies/domain/usecase/get_movie_details.dart';

import '../../../core/error/failure.dart';
import '../entities/movie_detail.dart';
import '../usecase/get_recommendations_usecase.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();

  Future<Either<Failure, List<Movie>>> getPopularMovies();

  Future<Either<Failure, List<Movie>>> getTopRatedMovies();

  Future<Either<Failure, MovieDetails>> getMovieDetails(
      MovieDetailsParameters parameters);
  Future<Either<Failure, List<Recommendations>>> getMovieRecommendations(
      RecommendationsParameters parameters);
}
