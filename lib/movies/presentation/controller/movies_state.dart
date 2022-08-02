import 'package:equatable/equatable.dart';
import 'package:movie_app_project/core/utils/enums/request_state.dart';

import '../../domain/entities/movie.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState requestState;
  final String nowPlayingMessage;

  const MoviesState({
    this.nowPlayingMovies = const [],
    this.requestState = RequestState.loading,
    this.nowPlayingMessage = "",
  });

  @override
  List<Object?> get props => [
        nowPlayingMovies,
        requestState,
        nowPlayingMessage,
      ];
}
