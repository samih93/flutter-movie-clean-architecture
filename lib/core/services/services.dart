import 'package:get_it/get_it.dart';
import 'package:movie/movies/data/datasource/remote_data_source/movie_remote_data_source.dart';
import 'package:movie/movies/data/repository/movie_repository.dart';
import 'package:movie/movies/domain/repository/base_movie_repository.dart';
import 'package:movie/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movie/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movie/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movie/movies/presentation/controller/movie_controller.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
// MovieController
    sl.registerFactory(() => MovieController(
          sl(),
          sl(),
          sl(),
        ));

    //Now Playing use cases
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));

    //Popular use cases
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));

    //Top Rated use cases
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    

    //Now Playing repository
    sl.registerLazySingleton<BaseMovieRepository>(() => MovieRepository(sl()));

    //Now Playing Data source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
