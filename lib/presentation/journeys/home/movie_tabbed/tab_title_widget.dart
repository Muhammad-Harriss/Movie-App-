import 'package:flutter/material.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/common/extension/size_extension.dart';
import 'package:movie_app/presentation/app_localization.dart';
import 'package:movie_app/presentation/themes/app_colors.dart';
import 'package:movie_app/presentation/themes/themes_text.dart';

class TabTitleWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isSelected; 

  const TabTitleWidget({
    super.key,
    required this.title,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,  
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border(
            bottom: BorderSide(
              color: isSelected ? AppColors.royalBlue : Colors.transparent,
              width: Sizes.dimen_2.h,
            ),
          ),
        ),
        child: Text(
          AppLocalizations.of(context).translate(title),
          style: isSelected
              ? Theme.of(context).textTheme.royalBlueSubtitle1
              : Theme.of(context).textTheme.headlineMedium
        ),
      ),
    );
  }
}
