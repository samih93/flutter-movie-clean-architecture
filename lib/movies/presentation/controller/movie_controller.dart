import 'package:flutter/cupertino.dart';
import 'package:movie/core/services/services.dart';
import 'package:movie/core/utils/enums.dart';
import 'package:movie/movies/data/datasource/remote_data_source/movie_remote_data_source.dart';
import 'package:movie/movies/data/models/movie_model.dart';
import 'package:movie/movies/data/repository/movie_repository.dart';
import 'package:movie/movies/domain/entities/movie.dart';
import 'package:movie/movies/domain/repository/base_movie_repository.dart';
import 'package:movie/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movie/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movie/movies/domain/usecases/get_top_rated_movies_usecase.dart';

class MovieController extends ChangeNotifier {
  
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MovieController(this.getNowPlayingMoviesUseCase, this.getPopularMoviesUseCase,
      this.getTopRatedMoviesUseCase);

  // get now playing
  List<Movie> nowPlayingMovies = [];
  RequestState nowPlayingRequestState = RequestState.loading;
  Future<List<Movie>> getNowPlayingMovies() async {
    final result = await getNowPlayingMoviesUseCase.execute();

    result.fold((l) {
      nowPlayingRequestState = RequestState.error;
      notifyListeners();
    }, (r) {
      nowPlayingMovies = r;
    });
    nowPlayingRequestState = RequestState.loaded;
    notifyListeners();

    // nowPlayingMovies.forEach((element) {
    //   print(element.title);
    // });
    return nowPlayingMovies;
  }

  // get now playing
  List<Movie> popularMovies = [];
  RequestState popularRequestState = RequestState.loading;
  Future<List<Movie>> getPopularMovies() async {
    final result = await getPopularMoviesUseCase.execute();

    result.fold((l) {
      popularRequestState = RequestState.error;
      notifyListeners();
    }, (r) {
      popularMovies = r;
    });
    popularRequestState = RequestState.loaded;
    notifyListeners();

    // nowPlayingMovies.forEach((element) {
    //   print(element.title);
    // });
    return popularMovies;
  }

  // get now playing
  List<Movie> topRatedMovies = [];
  RequestState topRatedRequestState = RequestState.loading;
  Future<List<Movie>> getTopRatedMovies() async {
    final result = await getTopRatedMoviesUseCase.execute();

    result.fold((l) {
      topRatedRequestState = RequestState.error;
      notifyListeners();
    }, (r) {
      topRatedMovies = r;
    });
    topRatedRequestState = RequestState.loaded;
    notifyListeners();

    // nowPlayingMovies.forEach((element) {
    //   print(element.title);
    // });
    return topRatedMovies;
  }
}
