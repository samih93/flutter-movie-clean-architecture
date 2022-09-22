import 'package:movie/core/error/exeptions.dart';
import 'package:movie/core/network/errormessage_model.dart';
import 'package:movie/movies/data/datasource/remote_data_source/movie_remote_data_source.dart';
import 'package:movie/movies/domain/entities/movie.dart';
import 'package:movie/movies/domain/repository/base_movie_repository.dart';
import 'package:dartz/dartz.dart';

class MovieRepository extends BaseMovieRepository {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MovieRepository(this.baseMovieRemoteDataSource);

  @override
  Future<Either<ServerExeption, List<Movie>>> getNowPlaying() async {
    final result = await baseMovieRemoteDataSource.getNowPlayingMovies();

    try {
      return Right(result);
    } on ServerExeption catch (e) {
      return Left(ServerExeption(errorMessageModel: e as ErrorMessageModel));
    }
  }

  @override
  Future<Either<ServerExeption, List<Movie>>> getPopularMovies() async {
    final result = await baseMovieRemoteDataSource.getPopularMovies();
    try {
      return Right(result);
    } on ServerExeption catch (e) {
      return Left(ServerExeption(errorMessageModel: e as ErrorMessageModel));
    }
  }

  @override
  Future<Either<ServerExeption, List<Movie>>> getTopRatedMovies() async {
    final result = await baseMovieRemoteDataSource.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerExeption catch (e) {
      return Left(ServerExeption(errorMessageModel: e as ErrorMessageModel));
    }
  }
}
