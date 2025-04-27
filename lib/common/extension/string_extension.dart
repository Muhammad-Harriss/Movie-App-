
import 'package:flutter/widgets.dart';
import 'package:movie_app/presentation/app_localization.dart';

extension StringExtension on String {
  String initialTrim(){
    return this.length > 15? '${this.substring(0 ,15)}...' : this;
  }

  String t(BuildContext context)
{    return AppLocalizations.of(context).translate(this);
  }
}