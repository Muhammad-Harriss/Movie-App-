import 'package:flutter/widgets.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/common/extension/size_extension.dart';
import 'package:movie_app/presentation/themes/app_colors.dart';

class Seprator extends StatelessWidget {
  const Seprator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.dimen_1.h,
      width: Sizes.dimen_80.w,
      padding: EdgeInsets.only(
        top: Sizes.dimen_2.h,
        bottom: Sizes.dimen_6.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.dimen_1.h),
        gradient: LinearGradient(colors: [
          AppColors.violet,
          AppColors.royalBlue
        ])
      ),
    );
    
  }
}