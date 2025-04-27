import 'package:flutter/material.dart';
import 'package:movie_app/presentation/themes/app_colors.dart';
import 'package:wiredash/wiredash.dart';

class WiredashWrapper extends StatelessWidget {
  final Widget child;
  final String languageCode;


  const WiredashWrapper({
    super.key,
    required this.languageCode,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Wiredash(
      projectId: 'movie-app-3y48mio',
      secret: 'XE5NvFSAyFUhJ86jA7bKjHfEOu9UGh8I',
      child: child,
      options: WiredashOptionsData(
        locale: Locale.fromSubtags(
          languageCode: languageCode,
          
        )
      ),
      theme: WiredashThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColors.royalBlue,
        secondPenColor: AppColors.violet,
        secondaryBackgroundColor: AppColors.vulcan,
        

      )
    );
    
  }
}
