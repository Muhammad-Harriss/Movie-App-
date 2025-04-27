import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/constants/languages.dart';
import 'package:movie_app/common/screenutil/screen_util.dart';
import 'package:movie_app/di/get_it.dart';
import 'package:movie_app/presentation/app_localization.dart';
import 'package:movie_app/presentation/blocs/languages/bloc/languages_bloc.dart';
import 'package:movie_app/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:movie_app/presentation/journeys/home/home_screen.dart';
import 'package:movie_app/presentation/themes/app_colors.dart';
import 'package:movie_app/presentation/themes/themes_text.dart';
import 'package:movie_app/presentation/wiredash_app.dart';

class MoviesApp extends StatefulWidget {
  @override
  State<MoviesApp> createState() => _MoviesAppState();
}

class _MoviesAppState extends State<MoviesApp> {
  late LanguagesBloc _languagesBloc;

  @override
  void initState() {
    super.initState();
    _languagesBloc = getItInstance<LanguagesBloc>();
  }

  @override
  void dispose() {
    _languagesBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context: context);

    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieCarouselBloc>(
          create: (_) => getItInstance<MovieCarouselBloc>()..add(CarouselLoadEvent()),
        ),
        BlocProvider<LanguagesBloc>.value(
          value: _languagesBloc,
        ),
      ],
      child: BlocBuilder<LanguagesBloc, LanguagesState>(
        builder: (context, state) {
          if (state is LanguageLoaded) {
            return WiredashWrapper(
              languageCode: state.locale.languageCode,
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: "Movie App",
                theme: ThemeData(
                  primaryColor: AppColors.vulcan,
                  scaffoldBackgroundColor: AppColors.vulcan,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  textTheme: ThemeText.getTextTheme(),
                  appBarTheme: const AppBarTheme(elevation: 0),
                  secondaryHeaderColor: AppColors.royalBlue,
                ),
                supportedLocales: Languages.languages.map((e) => Locale(e.code)).toList(),
                locale: state.locale,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                home: HomeScreen(),
              ),
            );
          }

        
          return const MaterialApp(
            home: Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
          );
        },
      ),
    );
  }
}
