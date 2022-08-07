import 'package:get_it/get_it.dart';
import 'package:movie_app_project/movies/data/datasource/movie_remote_datascource.dart';
import 'package:movie_app_project/movies/data/repository/movie_repository.dart';
import 'package:movie_app_project/movies/domain/repository/base_movie_repository.dart';
import 'package:movie_app_project/movies/domain/usecase/get_movie_details.dart';
import 'package:movie_app_project/movies/domain/usecase/get_now_playing_usecase.dart';
import 'package:movie_app_project/movies/presentation/controller/movies_bloc.dart';

import '../../movies/domain/usecase/get_popular_movies-usecase.dart';
import '../../movies/domain/usecase/get_recommendations_usecase.dart';
import '../../movies/domain/usecase/get_top_rated_movies_usecase.dart';
import '../../movies/presentation/controller/movie_details_bloc.dart';

final serviceLocator = GetIt.instance;

class ServiceLocator {
  void init() {
    ///BLOC
    serviceLocator.registerFactory(
        () => MoviesBloc(serviceLocator(), serviceLocator(), serviceLocator()));
    serviceLocator.registerFactory(
        () => MovieDetailsBloc(serviceLocator(), serviceLocator()));

    ///USE CASES
    serviceLocator.registerLazySingleton(
        () => GetNowPlayingMoviesUseCase(serviceLocator()));
    serviceLocator
        .registerLazySingleton(() => GetPopularMoviesUseCase(serviceLocator()));
    serviceLocator.registerLazySingleton(
        () => GetTopRatedMoviesUseCase(serviceLocator()));
    serviceLocator
        .registerLazySingleton(() => GetMovieDetailsUseCase(serviceLocator()));
    serviceLocator.registerLazySingleton(
        () => GetMovieRecommendationsUseCase(serviceLocator()));

    /// REPOSITORY
    serviceLocator.registerLazySingleton<BaseMoviesRepository>(
        () => MovieRepository(serviceLocator()));

    ///DATA SOURCE
    serviceLocator.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
