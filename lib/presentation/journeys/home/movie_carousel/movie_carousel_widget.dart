import 'package:flutter/widgets.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/presentation/journeys/home/movie_carousel/movie_backdrop_widget.dart';
import 'package:movie_app/presentation/journeys/home/movie_carousel/movie_data_widget.dart';
import 'package:movie_app/presentation/journeys/home/movie_carousel/movie_page_view.dart';
import 'package:movie_app/presentation/widgets/movie_app_bar.dart';
import 'package:movie_app/presentation/widgets/seprator.dart';

class MovieCarouselWidget extends StatelessWidget {
  final List<MovieEntity> movies;
  final int defaultIndex;
  const MovieCarouselWidget({
    super.key,
    required this.movies,
    required this.defaultIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        MovieBackdropWidget(),
        Column(
          children: [
            MovieAppBar(),
            SizedBox(
              height: 40,
            ),
            MoviePageView(
              movies: movies,
              initialpage:
                  defaultIndex, 
            ),
            MovieDataWidget(),
            Seprator(),
          ],
        ),
      ],
    );
  }
}
