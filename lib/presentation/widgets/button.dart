import 'package:flutter/material.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/common/extension/size_extension.dart';
import 'package:movie_app/common/extension/string_extension.dart';
import 'package:movie_app/presentation/themes/app_colors.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const Button({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            AppColors.royalBlue,
            AppColors.violet
          ]),
          borderRadius: BorderRadius.circular(Sizes.dimen_32.w)
        ),
        padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_32.w),
        margin: EdgeInsets.symmetric(vertical: Sizes.dimen_12.h),
        height: Sizes.dimen_48.h,
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            
            foregroundColor: Colors.white,
            textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold), // use labelLarge for button
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          ),
          child: Text(
            text.t(context),
          ),
        ),
      ),
    );
  }
}
