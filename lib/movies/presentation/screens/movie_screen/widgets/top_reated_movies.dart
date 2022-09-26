import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie/core/services/services.dart';
import 'package:movie/core/utils/api_constances.dart';
import 'package:movie/core/utils/enums.dart';
import 'package:movie/movies/presentation/controller/movie_controller.dart';
import 'package:movie/movies/presentation/screens/movie_screen/widgets/now_playing.dart';
import 'package:movie/movies/presentation/screens/movie_screen/widgets/popular_movies.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class TopRated extends StatelessWidget {
  const TopRated({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<MovieController>()..getTopRatedMovies();

    return Consumer<MovieController>(
        builder: (context, moviecontroller, child) {
      switch (moviecontroller.topRatedRequestState) {
        case RequestState.loading:
          return SizedBox(
            height: 120,
            child: Center(child: CircularProgressIndicator()),
          );
        case RequestState.loaded:
          return FadeIn(
            duration: const Duration(milliseconds: 500),
            child: SizedBox(
              height: 170.0,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: moviecontroller.topRatedMovies.length,
                itemBuilder: (context, index) {
                  final movie = moviecontroller.topRatedMovies[index];
                  return Container(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: InkWell(
                      onTap: () {
                        /// TODO : NAVIGATE TO  MOVIE DETAILS
                      },
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8.0)),
                        child: CachedNetworkImage(
                          width: 120.0,
                          fit: BoxFit.cover,
                          imageUrl: ApiConstances.imageUrl(movie.backdropPath),
                          placeholder: (context, url) => Shimmer.fromColors(
                            baseColor: Colors.grey[850]!,
                            highlightColor: Colors.grey[800]!,
                            child: Container(
                              height: 170.0,
                              width: 120.0,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        case RequestState.error:
          return Container();
      }
    });
  }
}
