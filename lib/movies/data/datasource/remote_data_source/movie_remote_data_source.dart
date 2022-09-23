import 'package:movie/core/error/exeptions.dart';
import 'package:movie/core/network/errormessage_model.dart';
import 'package:movie/core/utils/api_constances.dart';
import 'package:movie/core/utils/app_constances.dart';
import 'package:movie/movies/data/models/movie_model.dart';
import 'package:movie/movies/domain/entities/movie.dart';
import 'package:movie/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:dio/dio.dart';
import 'package:movie/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movie/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:dartz/dartz.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<Movie>> getNowPlayingMovies();
  Future<List<Movie>> getPopularMovies();
  Future<List<Movie>> getTopRatedMovies();
}

class MovieRemoteDataSource implements BaseMovieRemoteDataSource {
  @override
  Future<List<Movie>> getNowPlayingMovies() async {
    final response = await Dio().get('${ApiConstances.now_playing_MoviePAth}');
    if (response.statusCode == 200) {
      return List.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerExeption(
          errorMessageModel: ErrorMessageModel.fromJson(response.data()));
    }
  }

  @override
  Future<List<Movie>> getPopularMovies() async {
    final response = await Dio().get('${ApiConstances.popular_MoviePAth}');
    if (response.statusCode == 200) {
      return List.from((response.data()['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerExeption(
          errorMessageModel: ErrorMessageModel.fromJson(response.data()));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get('${ApiConstances.topRated_MoviePAth}');
    if (response.statusCode == 200) {
      return List.from((response.data()['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerExeption(
          errorMessageModel: ErrorMessageModel.fromJson(response.data()));
    }
  }
}
