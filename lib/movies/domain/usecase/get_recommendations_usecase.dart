import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_project/core/base_usecase/base_usecase.dart';
import 'package:movie_app_project/core/error/failure.dart';
import 'package:movie_app_project/movies/domain/entities/recommendation.dart';
import 'package:movie_app_project/movies/domain/repository/base_movie_repository.dart';

class GetMovieRecommendationsUseCase
    extends BaseUseCase<List<Recommendations>, RecommendationsParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMovieRecommendationsUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Recommendations>>> call(
      RecommendationsParameters parameters) async {
    return await baseMoviesRepository.getMovieRecommendations(parameters);
  }
}

class RecommendationsParameters extends Equatable {
  final int id;

  const RecommendationsParameters({required this.id});

  @override
  List<Object> get props => [id];
}
