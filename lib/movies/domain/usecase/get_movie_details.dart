import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_project/core/base_usecase/base_usecase.dart';
import 'package:movie_app_project/core/error/failure.dart';
import 'package:movie_app_project/movies/domain/entities/movie_detail.dart';
import 'package:movie_app_project/movies/domain/repository/base_movie_repository.dart';

class GetMovieDetailsUseCase
    extends BaseUseCase<MovieDetails, MovieDetailsParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMovieDetailsUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, MovieDetails>> call(
      MovieDetailsParameters parameters) async {
    return await baseMoviesRepository.getMovieDetails(parameters);
  }
}

class MovieDetailsParameters extends Equatable {
  final int id;

  const MovieDetailsParameters({required this.id});

  @override
  List<Object> get props => [id];
}
