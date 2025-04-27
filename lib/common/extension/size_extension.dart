import 'package:movie_app/common/screenutil/screen_util.dart';


extension SizeExtension on num {
    get w => ScreenUtil().setWidth(this.toDouble());

  double get h => ScreenUtil().setHeight(this.toDouble());

  double get sp => ScreenUtil().setSp(this.toDouble());
}