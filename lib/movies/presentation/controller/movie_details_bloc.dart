import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_project/core/utils/enums/request_state.dart';
import 'package:movie_app_project/movies/domain/entities/movie_detail.dart';
import 'package:movie_app_project/movies/domain/entities/recommendation.dart';
import 'package:movie_app_project/movies/domain/usecase/get_movie_details.dart';

import '../../domain/usecase/get_recommendations_usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetMovieRecommendationsUseCase getRecommendationsUseCase;
  MovieDetailsBloc(this.getMovieDetailsUseCase, this.getRecommendationsUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationsEvent>(_getMovieRecommendations);
  }

  FutureOr<void> _getMovieRecommendations(GetMovieRecommendationsEvent event,
      Emitter<MovieDetailsState> emit) async {
    final result = await getRecommendationsUseCase(
        RecommendationsParameters(id: event.id));
    result.fold(
      (l) => emit(
        state.copyWith(
            recommendationsState: RequestState.error,
            recommendationsMessage: l.failureMessage),
      ),
      (r) => emit(
        state.copyWith(
          recommendations: r,
          recommendationsState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await getMovieDetailsUseCase(MovieDetailsParameters(id: event.id));

    result.fold(
      (l) => emit(
        state.copyWith(
            movieDetailsState: RequestState.error,
            movieDetailsMessage: l.failureMessage),
      ),
      (r) => emit(
        state.copyWith(
          movie: r,
          movieDetailsState: RequestState.loaded,
        ),
      ),
    );
  }
}
