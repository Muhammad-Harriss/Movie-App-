import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/common/extension/size_extension.dart';
import 'package:movie_app/presentation/journeys/home/moive_detail/movie_detail_Argument.dart';
import 'package:movie_app/presentation/journeys/home/moive_detail/movie_screen_detail.dart';

class MovieCardWidget extends StatelessWidget {
  final int movieId;
  final String posterPath;
  final String title;
  final VoidCallback? onTap;

  const MovieCardWidget({
    super.key,
    required this.movieId,
    required this.posterPath,
    this.title = '',
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:  () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  MovieScreenDetail(movieDetailArguments: MovieDetailArgument(movieId: movieId))));

      },
      child: SizedBox(
        height: 450.h, 
        width: 360.w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible( 
              child: ClipRRect(
                borderRadius: BorderRadius.circular(Sizes.dimen_18.w),
                child: CachedNetworkImage(
                  imageUrl: posterPath.isNotEmpty
                      ? "https://image.tmdb.org/t/p/w500/$posterPath"
                      : "https://via.placeholder.com/500",
                  fit: BoxFit.fill,
                  height: 400.h, 
                  width: 320.w,
                  placeholder: (context, url) => Container(
                    height: 400.h,
                    width: 300.w,
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                      color: Colors.redAccent,
                      strokeWidth: 2,
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    height: 400.h,
                    width: 300.w,
                    color: Colors.grey[900],
                    child: Icon(
                      Icons.broken_image,
                      color: Colors.red,
                      size: 60,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 2.h), 
            SizedBox(
              height: 25.h, 
              child: Text(
                title,
                style: TextStyle(
                  fontSize: Sizes.dimen_32.sp, 
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
