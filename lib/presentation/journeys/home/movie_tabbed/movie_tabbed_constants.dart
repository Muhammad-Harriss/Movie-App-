
import 'package:movie_app/common/constants/translation_constanats.dart';
import 'package:movie_app/presentation/journeys/home/movie_tabbed/tab.dart';

class MovieTabbedConstants {
    static List<Tab> movieTab = [

        Tab(index: 0, title: TranslationConstants.popular),
        Tab(index: 1, title: TranslationConstants.Now),
        Tab(index: 2, title: TranslationConstants.Soon)
    ];

}