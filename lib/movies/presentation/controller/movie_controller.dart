import 'package:flutter/cupertino.dart';
import 'package:movie/core/utils/enums.dart';
import 'package:movie/movies/data/datasource/remote_data_source/movie_remote_data_source.dart';
import 'package:movie/movies/data/models/movie_model.dart';
import 'package:movie/movies/data/repository/movie_repository.dart';
import 'package:movie/movies/domain/entities/movie.dart';
import 'package:movie/movies/domain/repository/base_movie_repository.dart';
import 'package:movie/movies/domain/usecases/get_now_playing_movies_usecase.dart';

class MovieController extends ChangeNotifier {
  // get now playing
  List<Movie> movies = [];
  RequestState moviesRequestStat = RequestState.loading;
  Future<List<Movie>> GetNowPlayingMovies() async {
    BaseMovieRemoteDataSource baseMovieRemoteDataSource =
        MovieRemoteDataSource();
    BaseMovieRepository baseMovieRepository =
        MovieRepository(baseMovieRemoteDataSource);
    final result =
        await GetNowPlayingMoviesUseCase(baseMovieRepository).execute();

    result.fold((l) {
      moviesRequestStat = RequestState.error;
      notifyListeners();
    }, (r) {
      movies = r;
    });
    moviesRequestStat = RequestState.loaded;
    notifyListeners();

    movies.forEach((element) {
      print(element.title);
    });
    return movies;
  }
}
