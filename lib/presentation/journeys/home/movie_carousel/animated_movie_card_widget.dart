import 'package:flutter/material.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/common/extension/size_extension.dart';
import 'package:movie_app/common/screenutil/screen_util.dart';
import 'package:movie_app/presentation/journeys/home/movie_carousel/movie_card_widget.dart';

class AnimatedMovieCardWidget extends StatelessWidget {
  final int index;
  final int movieId;
  final String posterPath;
  final PageController pageController;

  const AnimatedMovieCardWidget({
    super.key,
    required this.index,
    required this.movieId,
    required this.posterPath,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: pageController,
      builder: (context, child) {
        double value = 1.0;

        if (pageController.position.haveDimensions) {
          value = (pageController.page ?? 0.0) - index.toDouble();
          value = (1 - (value.abs() * 0.3)).clamp(0.8, 1.0); 
        }

        double calculatedHeight =
            (Curves.easeOutCubic.transform(value) * ScreenUtil.screenHeight * 0.6)
                .clamp(320.0, 480.0); 

        return Transform.scale(
          scale: value, 
          child: Transform.translate(
            offset:  Offset((index == 0) ? -20 : (value - 1) * -30, (1 - value) * 40), 
            child: Opacity(
              opacity: value.clamp(0.6, 1.0), 
              child: SizedBox(
                height: calculatedHeight,
                width: Sizes.dimen_280.w, 
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: MovieCardWidget(
                    movieId: movieId,
                    posterPath: posterPath,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
