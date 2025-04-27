import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/constants/languages.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/common/constants/translation_constanats.dart';
import 'package:movie_app/common/extension/size_extension.dart';
import 'package:movie_app/common/extension/string_extension.dart';
import 'package:movie_app/presentation/app_dialog.dart';
import 'package:movie_app/presentation/blocs/languages/bloc/languages_bloc.dart';
import 'package:movie_app/presentation/journeys/home/drawer/navigation_expand_list_tile.dart';
import 'package:movie_app/presentation/journeys/home/drawer/navigation_list_item.dart';

import 'package:movie_app/presentation/widgets/logo.dart';
import 'package:wiredash/wiredash.dart';

class NavigationDrawer_ extends StatelessWidget {
  const NavigationDrawer_({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.5),
            blurRadius: 4,
          ),
        ],
      ),
      width: Sizes.dimen_360.w,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: Sizes.dimen_8.w,
                left: Sizes.dimen_8.w,
                right: Sizes.dimen_8.w,
                bottom: Sizes.dimen_18.h,
              ),
              child: Logo(height: Sizes.dimen_48.h),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  NavigationListItem(
                    title: TranslationConstants.favoriteMovies.t(context),
                    onPressed: () {},
                  ),
                  NavigationExpandedListItem(
                    onPressed: (index) {
                      final selectedLanguage = Languages.languages[index];
                      BlocProvider.of<LanguagesBloc>(context).add(
                        TogglelanguageEvent(selectedLanguage),
                      );
                    },
                    title: TranslationConstants.languages.t(context),
                    children: Languages.languages.map((e) => e.value).toList(),
                  ),
                  NavigationListItem(
                    title: TranslationConstants.feedback.t(context),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Wiredash.of(context).show();
                    },
                  ),
                  NavigationListItem(
                    title: TranslationConstants.about.t(context),
                    onPressed: () {
                      Navigator.of(context).pop();
                      _showDialog(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      
      builder: (context) {
        return AppDialog(
         title: TranslationConstants.about,
         description: TranslationConstants.aboutDescription,
          buttonText: TranslationConstants.okay,
           image: Image.asset(
  'assets/pngs/tmdb_logo.png',  
  height: Sizes.dimen_100.h,
)

           );
      },
    );
  }
}
