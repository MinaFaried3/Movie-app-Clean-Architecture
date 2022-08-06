import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:movie_app_project/core/utils/enums/request_state.dart';
import 'package:movie_app_project/movies/domain/usecase/get_now_playing_usecase.dart';
import 'package:movie_app_project/movies/domain/usecase/get_top_rated_movies_usecase.dart';
import 'package:movie_app_project/movies/presentation/controller/movies_event.dart';
import 'package:movie_app_project/movies/presentation/controller/movies_state.dart';

import '../../domain/usecase/get_popular_movies-usecase.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(
    this.getNowPlayingMoviesUseCase,
    this.getPopularMoviesUseCase,
    this.getTopRatedMoviesUseCase,
  ) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlaying);
    on<GetPopularMoviesEvent>(_getPopular);
    on<GetTopRatedMoviesEvent>(_getTopRated);
  }

  FutureOr<void> _getTopRated(event, emit) async {
    final results = await getTopRatedMoviesUseCase.execute();

    results.fold(
      (l) => emit(
        state.copyWith(
            topRatedMessage: l.failureMessage,
            topRatedState: RequestState.error),
      ),
      (r) => emit(
        state.copyWith(topRatedMovies: r, topRatedState: RequestState.loaded),
      ),
    );
  }

  FutureOr<void> _getPopular(event, emit) async {
    final results = await getPopularMoviesUseCase.execute();

    results.fold(
      (l) => emit(
        state.copyWith(
            popularMessage: l.failureMessage, popularState: RequestState.error),
      ),
      (r) => emit(
        state.copyWith(popularMovies: r, popularState: RequestState.loaded),
      ),
    );
  }

  FutureOr<void> _getNowPlaying(event, emit) async {
    final result = await getNowPlayingMoviesUseCase.execute();

    result.fold(
      (l) => emit(
        state.copyWith(
          nowPlayingMessage: l.failureMessage,
          nowPlayingState: RequestState.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          nowPlayingMovies: r,
          nowPlayingState: RequestState.loaded,
        ),
      ),
    );
  }
}
