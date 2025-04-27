import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/common/extension/size_extension.dart';
import 'package:movie_app/presentation/blocs/cast/cast_bloc.dart';

class CastWidget extends StatelessWidget {
  const CastWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CastBloc, CastState>(
      builder: (context, state) {
        if (state is CastLoaded) {
          return Container(
            height: Sizes.dimen_200.h,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: state.casts.length,
              itemBuilder: (context, index){
                final castEntity = state.casts[index];
                return Container(
                  height: Sizes.dimen_200.h,
                  width: Sizes.dimen_200.w,
                  child: Card(
                    elevation: 1,
                    margin: EdgeInsetsDirectional.symmetric(
                      horizontal: Sizes.dimen_8.w,
                      vertical: Sizes.dimen_4.w,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(Sizes.dimen_8.w)
                      )
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(8.w)
                            ),
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              height: Sizes.dimen_100.h,
                              width: Sizes.dimen_200.w,
                              imageUrl: 'https://image.tmdb.org/t/p/w500${castEntity.posterpath}'),
                          ),
                        ),
                        Text(
                          castEntity.name,
                          overflow: TextOverflow.fade,
                          maxLines: 1,
                          style: TextStyle(fontSize: 10, color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 8,
                            right: 8,
                            bottom: 2,
                          ),
                          child: Text(
                            castEntity.character,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(fontSize: 10, color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),

                  ),

                );

              }),
          ); // You can replace this with your actual Cast UI
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
