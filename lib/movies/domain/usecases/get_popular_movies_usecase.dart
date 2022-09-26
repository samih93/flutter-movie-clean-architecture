import 'package:movie/core/error/exeptions.dart';
import 'package:movie/movies/domain/entities/movie.dart';
import 'package:movie/movies/domain/repository/base_movie_repository.dart';
import 'package:dartz/dartz.dart';

class GetPopularMoviesUseCase {
  final BaseMovieRepository baseMovieRepository;

  GetPopularMoviesUseCase(this.baseMovieRepository);

  Future<Either<ServerExeption, List<Movie>>> execute() async {
    return await baseMovieRepository.getPopularMovies();
  }
}
