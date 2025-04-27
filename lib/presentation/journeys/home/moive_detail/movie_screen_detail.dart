import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/common/constants/translation_constanats.dart';
import 'package:movie_app/common/extension/size_extension.dart';
import 'package:movie_app/common/extension/string_extension.dart';
import 'package:movie_app/di/get_it.dart';
import 'package:movie_app/presentation/blocs/cast/cast_bloc.dart';
import 'package:movie_app/presentation/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:movie_app/presentation/blocs/vedios/vedios_bloc.dart';
import 'package:movie_app/presentation/journeys/home/moive_detail/big_poster.dart';
import 'package:movie_app/presentation/journeys/home/moive_detail/cast_wiget.dart';
import 'package:movie_app/presentation/journeys/home/moive_detail/movie_detail_Argument.dart';
import 'package:movie_app/presentation/journeys/home/moive_detail/vedios_widget.dart';

class MovieScreenDetail extends StatefulWidget {
  final MovieDetailArgument movieDetailArguments;

  const MovieScreenDetail({super.key, required this.movieDetailArguments});

  @override
  State<MovieScreenDetail> createState() => _MovieScreenDetailState();
}

class _MovieScreenDetailState extends State<MovieScreenDetail> {
  late MovieDetailBloc _movieDetailBloc;
  late CastBloc _castBloc;
  late VediosBloc _vediosBloc;

  @override
  void initState() {
    super.initState();
    _movieDetailBloc = getItInstance<MovieDetailBloc>();
    _castBloc = _movieDetailBloc.castBloc;
    _vediosBloc = _movieDetailBloc.vediosBloc;
    _movieDetailBloc.add(
      MovieDetailLoadEvent(movieId: widget.movieDetailArguments.movieId),
    );
  }

  @override
  void dispose() {
    _movieDetailBloc.close();
    _castBloc.close();
    _vediosBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: _movieDetailBloc),
          BlocProvider.value(value: _castBloc),
          BlocProvider.value(value: _vediosBloc)

        ],

        child: BlocBuilder<MovieDetailBloc, MovieDetailState>(
          builder: (context, state) {
            if (state is MovieDetailLoaded) {
              final movieDetail = state.movieDetailEntity;
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    BigPoster(
                      movie: movieDetail,
                
                    ),
                    Padding(padding: EdgeInsets.symmetric(
                      horizontal: Sizes.dimen_32.w,
                      
                       ),
                    child: Text(
                      movieDetail.overview,
                      style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(
                      vertical: Sizes.dimen_10.h,
                      horizontal: Sizes.dimen_32.w
                    ),
                    child: Text(
                     TranslationConstants.cast.t(context),
                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ), 
                    ),
                    CastWidget(),
                    VediosWidget(vediosBloc: _vediosBloc,),
                    
                
                
                  ],
                ),
              );
            } else if (state is MovieDetailError) {
              return Container(
                
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
