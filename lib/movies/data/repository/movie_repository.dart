import 'package:dartz/dartz.dart';
import 'package:movie_app_project/core/error/exceptions.dart';
import 'package:movie_app_project/core/error/failure.dart';
import 'package:movie_app_project/movies/data/datasource/movie_remote_datascource.dart';
import 'package:movie_app_project/movies/domain/entities/movie.dart';
import 'package:movie_app_project/movies/domain/entities/movie_detail.dart';
import 'package:movie_app_project/movies/domain/entities/recommendation.dart';
import 'package:movie_app_project/movies/domain/repository/base_movie_repository.dart';
import 'package:movie_app_project/movies/domain/usecase/get_movie_details.dart';
import 'package:movie_app_project/movies/domain/usecase/get_recommendations_usecase.dart';

class MovieRepository extends BaseMoviesRepository {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MovieRepository(this.baseMovieRemoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    final result = await baseMovieRemoteDataSource.getNowPlayingMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await baseMovieRemoteDataSource.getPopularMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result = await baseMovieRemoteDataSource.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(
      MovieDetailsParameters parameters) async {
    final result = await baseMovieRemoteDataSource.getMovieDetails(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendations>>> getMovieRecommendations(
      RecommendationsParameters parameters) async {
    final result =
        await baseMovieRemoteDataSource.getMovieRecommendations(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
