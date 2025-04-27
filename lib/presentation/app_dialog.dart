import 'package:flutter/material.dart';
import 'package:movie_app/common/constants/size_constants.dart';

import 'package:movie_app/common/extension/size_extension.dart';
import 'package:movie_app/common/extension/string_extension.dart';
import 'package:movie_app/presentation/themes/app_colors.dart';
import 'package:movie_app/presentation/widgets/button.dart';

class AppDialog extends StatelessWidget {
  final String title, description, buttonText;
  final Widget image;

  const AppDialog({
    super.key,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.vulcan,
      elevation: Sizes.dimen_32,
      insetPadding: EdgeInsets.all(Sizes.dimen_32.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(Sizes.dimen_8.w)),
      ),
      child: Padding(
        padding: EdgeInsets.all(Sizes.dimen_16.w), // Padding for internal content
        child: Container(
          padding: EdgeInsets.only(
            top: Sizes.dimen_4.h,
            left: Sizes.dimen_16.w,
            right: Sizes.dimen_16.w,

          ),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColors.vulcan,
                blurRadius: Sizes.dimen_16)
            ]
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title.t(context),
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: Colors.white, // Set the color to white
                  ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: Sizes.dimen_16.h), // Space between title and description
              Padding(
                padding: EdgeInsets.symmetric(vertical: Sizes.dimen_16.h),
                child: Text(
                  description.t(context),
                  
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.white, // Set the color to white
                  ),
                ),
              ),
              image,
              SizedBox(height: Sizes.dimen_16.h), // Space after the image
              Button(text: buttonText.t(context), onPressed: (){
               Navigator.of(context).pop();
              })
          
            ],
          ),
        ),
      ),
    );
  }
}
