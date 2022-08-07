part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final MovieDetails? movie;
  final RequestState movieDetailsState;
  final String movieDetailsMessage;
  final List<Recommendations> recommendations;
  final RequestState recommendationsState;
  final String recommendationsMessage;

  const MovieDetailsState({
    this.movie,
    this.movieDetailsState = RequestState.loading,
    this.movieDetailsMessage = '',
    this.recommendations = const [],
    this.recommendationsState = RequestState.loading,
    this.recommendationsMessage = '',
  });

  MovieDetailsState copyWith({
    MovieDetails? movie,
    RequestState? movieDetailsState,
    String? movieDetailsMessage,
    List<Recommendations>? recommendations,
    RequestState? recommendationsState,
    String? recommendationsMessage,
  }) {
    return MovieDetailsState(
      movie: movie ?? this.movie,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      recommendations: recommendations ?? this.recommendations,
      recommendationsState: recommendationsState ?? this.recommendationsState,
      recommendationsMessage:
          recommendationsMessage ?? this.recommendationsMessage,
    );
  }

  @override
  List<Object?> get props => [
        movie,
        movieDetailsState,
        movieDetailsMessage,
        recommendations,
        recommendationsState,
        recommendationsMessage,
      ];
}
