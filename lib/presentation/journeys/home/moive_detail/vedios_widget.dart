import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/constants/translation_constanats.dart';
import 'package:movie_app/common/extension/string_extension.dart';
import 'package:movie_app/presentation/blocs/vedios/vedios_bloc.dart';
import 'package:movie_app/presentation/journeys/home/watch_Videos/watch_videos_Arguments.dart';
import 'package:movie_app/presentation/journeys/home/watch_Videos/watch_videos_screen.dart';
import 'package:movie_app/presentation/widgets/button.dart';

class VediosWidget extends StatelessWidget {
  final VediosBloc vediosBloc;
  const VediosWidget({super.key, required this.vediosBloc});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VediosBloc, VediosState>(
      bloc: vediosBloc,
      builder: (context, state) {
        if (state is VediosLoaded && state.vedios.isNotEmpty) {
          return Button(
            text: TranslationConstants.watchTrailers.t(context),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return WatchVideosScreen(
                      watchVideosArguments: WatchVideosArguments(state.vedios),
                    );
                  },
                ),
              );
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
