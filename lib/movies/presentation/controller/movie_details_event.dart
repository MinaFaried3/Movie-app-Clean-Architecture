part of 'movie_details_bloc.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();
}

class GetMovieDetailsEvent extends MovieDetailsEvent {
  final int id;

  const GetMovieDetailsEvent({required this.id});
  @override
  // TODO: implement props
  List<Object?> get props => [id];
}

class GetMovieRecommendationsEvent extends MovieDetailsEvent {
  final int id;

  const GetMovieRecommendationsEvent({required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
