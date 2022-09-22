import 'package:movie/core/error/exeptions.dart';
import 'package:movie/movies/domain/entities/movie.dart';
import 'package:dartz/dartz.dart';

abstract class BaseMovieRepository {
  Future<Either<ServerExeption, List<Movie>>> getNowPlaying();
  Future<Either<ServerExeption, List<Movie>>> getPopularMovies();
  Future<Either<ServerExeption, List<Movie>>> getTopRatedMovies();
}
