import 'package:dio/dio.dart';
import 'package:movie_app_project/core/error/exceptions.dart';
import 'package:movie_app_project/core/network/error_message_model.dart';
import 'package:movie_app_project/movies/data/models/movie_details_model.dart';
import 'package:movie_app_project/movies/data/models/movie_model.dart';
import 'package:movie_app_project/movies/data/models/recommendations_model.dart';
import 'package:movie_app_project/movies/domain/usecase/get_movie_details.dart';
import 'package:movie_app_project/movies/domain/usecase/get_recommendations_usecase.dart';

import '../../../core/network/api_constance.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters);
  Future<List<RecommendationsModel>> getMovieRecommendations(
      RecommendationsParameters parameters);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstance.nowPlayingMoviePath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstance.popularMoviePath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstance.topRatedMoviePath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(
      MovieDetailsParameters parameters) async {
    final response =
        await Dio().get(ApiConstance.movieDetailsPath(parameters.id));

    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<RecommendationsModel>> getMovieRecommendations(
      RecommendationsParameters parameters) async {
    final response =
        await Dio().get(ApiConstance.recommendationsPath(parameters.id));
    if (response.statusCode == 200) {
      return List<RecommendationsModel>.from((response.data["results"] as List)
          .map((e) => RecommendationsModel.fromJson(e)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
