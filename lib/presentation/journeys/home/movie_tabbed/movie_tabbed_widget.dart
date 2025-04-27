import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/common/constants/translation_constanats.dart';
import 'package:movie_app/common/extension/size_extension.dart';
import 'package:movie_app/common/extension/string_extension.dart';
import 'package:movie_app/presentation/blocs/movie_tabbed/bloc/movie_tabbed_bloc.dart';
import 'package:movie_app/presentation/journeys/home/movie_carousel/app_error_widget.dart';
import 'package:movie_app/presentation/journeys/home/movie_tabbed/movie_listview_builder.dart';
import 'package:movie_app/presentation/journeys/home/movie_tabbed/movie_tabbed_constants.dart';
import 'package:movie_app/presentation/journeys/home/movie_tabbed/tab_title_widget.dart';

class MovieTabbedWidget extends StatefulWidget {
  const MovieTabbedWidget({super.key});

  @override
  State<MovieTabbedWidget> createState() => _MovieTabbedWidgetState();
}

class _MovieTabbedWidgetState extends State<MovieTabbedWidget> {
  MovieTabbedBloc get movieTabbedBloc => BlocProvider.of<MovieTabbedBloc>(context);
  int currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    movieTabbedBloc.add(MovieTabChangedEvent(currentTabIndex: currentTabIndex));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieTabbedBloc, MovieTabbedState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(top: Sizes.dimen_8.h),
          child: Column(
            children: [ 
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int i = 0; i < MovieTabbedConstants.movieTab.length; i++)
                    TabTitleWidget(
                      title: MovieTabbedConstants.movieTab[i].title,
                      onTap: () => _onTabTapped(i), 
                      isSelected: i == currentTabIndex, 
                    ),
                ],
              ),
              if (state is MovieTabChanged)
               state.movies.isEmpty  ?
               Expanded(child: Center(child: Text(
                TranslationConstants.noMovie.t(context),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleSmall,
                ),)):
                Expanded(child: MovieListviewBuilder(movies: state.movies)),
              if (state is MovieTabLoadError)
              Expanded(
                child: AppErrorWiget(errorType: state.errorType, onPressed: () => movieTabbedBloc.add(MovieTabChangedEvent(
                  currentTabIndex: state.currentTabIndex,
                
                ))),
              )
            ],
          ),
        );
      },
    );
  }

  void _onTabTapped(int index) {
    setState(() {
      currentTabIndex = index;
    });
    movieTabbedBloc.add(MovieTabChangedEvent(currentTabIndex: index));
  }
}
