
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/common/extension/size_extension.dart';
import 'package:movie_app/common/extension/string_extension.dart';
import 'package:movie_app/presentation/journeys/home/moive_detail/movie_detail_Argument.dart';
import 'package:movie_app/presentation/journeys/home/moive_detail/movie_screen_detail.dart';

class MovieTabCardWidget extends StatelessWidget {
  final int movieId;
  final String title, posterPath;
  const MovieTabCardWidget({super.key,
  required this.movieId,
  required this.posterPath,
  required this.title

  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => MovieScreenDetail(movieDetailArguments: MovieDetailArgument(movieId: movieId))));


      },
      child: Column(
        crossAxisAlignment:  CrossAxisAlignment.center,
        children: [
          Expanded(child: ClipRRect(
            borderRadius: BorderRadius.circular(Sizes.dimen_16.w),
            child: CachedNetworkImage(imageUrl: "https://image.tmdb.org/t/p/w500/$posterPath",
            fit: BoxFit.cover,
            ),
          )
          ),
          Padding(
            padding: EdgeInsets.only(top: Sizes.dimen_6.h),
            child: Text(
              title.initialTrim(),
              maxLines: 1,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium
            ),
          )
          
      
        ],
      ),
    );
  }
}