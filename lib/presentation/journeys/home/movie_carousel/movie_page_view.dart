import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/common/extension/size_extension.dart';
import 'package:movie_app/common/screenutil/screen_util.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/presentation/blocs/movie_backdrop/bloc/movie_backdrop_bloc.dart';
import 'package:movie_app/presentation/journeys/home/movie_carousel/animated_movie_card_widget.dart';


class MoviePageView extends StatefulWidget {
  final List<MovieEntity> movies;
  final int initialpage;

  const MoviePageView({
    super.key,
    required this.movies,
    required this.initialpage,
  });

  @override
  State<MoviePageView> createState() => _MoviePageViewState();
}

class _MoviePageViewState extends State<MoviePageView> {
  late PageController _pageController; // ✅ Correctly using `late`

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: widget.initialpage,
      keepPage: false,
      viewportFraction: 0.52,
    );
  }

  @override
  void dispose() {
    _pageController.dispose(); // ✅ Dispose before super.dispose()
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Sizes.dimen_10.h),
      height: ScreenUtil.screenHeight *0.75,
      child: PageView.builder(
        controller: _pageController,
        itemCount: widget.movies.length,
         physics: BouncingScrollPhysics(),
        pageSnapping: true,
        itemBuilder: (context, index) {
          final MovieEntity movie = widget.movies[index];
          return AnimatedMovieCardWidget(
          index: index,
          pageController: _pageController,
          movieId: movie.id ?? 0, 
          posterPath: movie.posterPath ?? '');
        },
        onPageChanged: (index) {
          BlocProvider.of<MovieBackdropBloc>(context).add(MovieBackdropChangedEvent(widget.movies[index]));
        },
      ),
    );
  }
}
