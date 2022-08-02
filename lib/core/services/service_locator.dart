import 'package:get_it/get_it.dart';
import 'package:movie_app_project/movies/data/datasource/movie_remote_datascource.dart';
import 'package:movie_app_project/movies/data/repository/movie_repository.dart';
import 'package:movie_app_project/movies/domain/repository/base_movie_repository.dart';
import 'package:movie_app_project/movies/domain/usecase/get_now_playing_usecase.dart';
import 'package:movie_app_project/movies/presentation/controller/movies_bloc.dart';

final serviceLocator = GetIt.instance;

class ServiceLocator {
  void init() {
    ///BLOC
    serviceLocator.registerFactory(() => MoviesBloc(serviceLocator()));

    ///USE CASES
    serviceLocator.registerLazySingleton(
        () => GetNowPlayingMoviesUseCase(serviceLocator()));

    /// REPOSITORY
    serviceLocator.registerLazySingleton<BaseMoviesRepository>(
        () => MovieRepository(serviceLocator()));

    ///DATA SOURCE
    serviceLocator.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
