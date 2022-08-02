import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_app_project/core/utils/enums/request_state.dart';
import 'package:movie_app_project/movies/domain/usecase/get_now_playing_usecase.dart';
import 'package:movie_app_project/movies/presentation/controller/movies_event.dart';
import 'package:movie_app_project/movies/presentation/controller/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  MoviesBloc(this.getNowPlayingMoviesUseCase) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      final result = await getNowPlayingMoviesUseCase.execute();

      result.fold(
        (l) => emit(
          MoviesState(
            nowPlayingMessage: l.failureMessage,
            requestState: RequestState.error,
          ),
        ),
        (r) => emit(
          MoviesState(
            nowPlayingMovies: r,
            requestState: RequestState.loaded,
          ),
        ),
      );

      if (kDebugMode) {
        print(result);
      }
    });
  }
}
