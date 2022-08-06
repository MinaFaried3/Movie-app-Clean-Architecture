import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_project/core/services/service_locator.dart';
import 'package:movie_app_project/movies/domain/entities/movie.dart';
import 'package:movie_app_project/movies/presentation/screens/movies_screen.dart';

import 'core/utils/constants/bloc_observer.dart';

void main() {
  Movie movie = const Movie(
      id: 2,
      title: "title",
      backdropPath: "backdropPath",
      genreIds: const [2],
      overview: "overview",
      voteAverage: 3.5,
      releaseDate: "2.3");
  Movie movie1 = const Movie(
      id: 2,
      title: "title",
      backdropPath: "backdropPath",
      genreIds: const [2],
      overview: "overview",
      voteAverage: 3.5,
      releaseDate: "2.3");

  if (kDebugMode) {
    // print(movie == movie1);
    // print(movie.hashCode);
    // print(movie1.hashCode);
  }
  ServiceLocator().init();
  BlocOverrides.runZoned(
    () async {
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainMoviesScreen(),
    );
  }
}
