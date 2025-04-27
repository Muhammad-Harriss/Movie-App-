import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/common/extension/num_extension.dart';
import 'package:movie_app/common/extension/size_extension.dart';
import 'package:movie_app/common/screenutil/screen_util.dart';
import 'package:movie_app/domain/entities/movie_detail_entity.dart';
import 'package:movie_app/presentation/journeys/home/moive_detail/movie_detail.app.bar.dart';

class BigPoster extends StatelessWidget {
  final MovieDetailEntity movie;
  const BigPoster({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final imagePath = movie.backdropPath;

    if ( imagePath.isEmpty) {
      return const Icon(Icons.broken_image);
    }

    return Stack(
      children: [
        Container(
          height: 500,
          width: 400,
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).primaryColor.withOpacity(0.3),
                Theme.of(context).primaryColor,
              ],
            ),
          ),
          child: CachedNetworkImage(
            imageUrl: 'https://image.tmdb.org/t/p/w500$imagePath',
            fit: BoxFit.cover,
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 20,
          child: ListTile(
            title: Text(
              movie.title ,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.white),
            ),
            
            subtitle: Text(
              movie.releaseDate ,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style:  TextStyle(color: Colors.white70, fontSize: 10, fontWeight: FontWeight.bold),
            ),
            trailing: Text(
              movie.voteAverage.convertToPercentageString(),
              style: const TextStyle(color: Colors.indigo, fontSize: 20)
            ),
          ),
        ),
        Positioned(
          left: Sizes.dimen_16.w,
          right: Sizes.dimen_18.w,
          top: ScreenUtil.statusBarHeight + Sizes.dimen_4.h,
          child: MovieDetailAppBar(),
        )
      ],
    );
  }
}
