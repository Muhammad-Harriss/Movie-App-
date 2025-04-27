
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/common/extension/size_extension.dart';
import 'package:movie_app/common/screenutil/screen_util.dart';
import 'package:movie_app/presentation/journeys/home/drawer/navigation_drawer.dart';
import 'package:movie_app/presentation/widgets/logo.dart';

class MovieAppBar extends StatelessWidget {
  const MovieAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(
      top: ScreenUtil.statusBarHeight + Sizes.dimen_4.h,
      left: Sizes.dimen_16.w,
      right: Sizes.dimen_16.w
    ),
    child: Row(
      children: [

        //Menu Button
        IconButton(onPressed: (){
          NavigationDrawer_();
          Scaffold.of(context).openDrawer();
        }, icon: SvgPicture.asset(
          'assets/svgs/menu.svg',
           height: Sizes.dimen_32.h,
          )),

          //logo
          Expanded(child: Logo(height: Sizes.dimen_32)),

          //serch button
          IconButton(onPressed: (){
          }, icon: Icon(
            Icons.search,
            color: Colors.white,
            size: Sizes.dimen_32.h,
            ))
      ],
    ),
    
    );
  }
}