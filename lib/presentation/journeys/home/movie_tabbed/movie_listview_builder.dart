import 'package:flutter/widgets.dart';
import 'package:movie_app/common/extension/size_extension.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/presentation/journeys/home/movie_carousel/movie_card_widget.dart';

class MovieListviewBuilder extends StatelessWidget {
  final List<MovieEntity> movies;

  const MovieListviewBuilder({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final MovieEntity movie = movies[index];
          return MovieCardWidget(
            title: movie.title ?? '',
            movieId: movie.id ?? 0,
            posterPath: movie.posterPath ?? '',  
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 14.w,
          );
        },
        itemCount: movies.length,
      ),
    );
  }
}
