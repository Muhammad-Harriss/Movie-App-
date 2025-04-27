import 'dart:ui';

import 'package:flutter/widgets.dart';

class ScreenUtil {
  static ScreenUtil _instance = ScreenUtil._();
  
  static const double defaultWidth = 414.0;
  static const double defaultHeight = 896.0;

  /// Size of the phone in UI Design, px
  late double uiWidthPx;
  late double uiHeightPx;

  /// allowFontScaling Specifies whether fonts should scale to respect Text Size accessibility settings. The default is false.
  late bool allowFontScaling;

  static double _screenWidth = 0.0; // Initialize with a default value
  static double _screenHeight = 0.0; // Initialize with a default value
  static double _pixelRatio = 1.0; // Default value
  static double _statusBarHeight = 0.0; // Default value
  static double _bottomBarHeight = 0.0; // Default value
  static double _textScaleFactor = 1.0; // Default value

  // Private constructor
  ScreenUtil._();

  // Factory constructor for getting the instance
  factory ScreenUtil() {
    return _instance;
  }

  // Initialize method that requires context
  static void init({
    double width = defaultWidth,
    double height = defaultHeight,
    bool allowFontScaling = false,
    required BuildContext context,
  }) {
    _instance.uiWidthPx = width;
    _instance.uiHeightPx = height;
    _instance.allowFontScaling = allowFontScaling;
     final platformDispatcher = PlatformDispatcher.instance;

    // Use MediaQuery to get the necessary data after the context is available
    _pixelRatio = platformDispatcher.views.first.devicePixelRatio;
    _screenWidth = MediaQuery.of(context).size.width;
    _screenHeight = MediaQuery.of(context).size.height;
    _statusBarHeight = MediaQuery.of(context).padding.top;
    _bottomBarHeight = MediaQuery.of(context).padding.bottom;
    _textScaleFactor = MediaQuery.of(context).textScaler.scale(1);
  }

  /// The number of font pixels for each logical pixel.
  static double get textScaleFactor => _textScaleFactor;

  /// The size of the media in logical pixels (e.g., the size of the screen).
  static double get pixelRatio => _pixelRatio;

  /// The horizontal extent of this size.
  static double get screenWidth => _screenWidth / _pixelRatio;

  /// The vertical extent of this size. dp
  static double get screenHeight => _screenHeight / _pixelRatio;

  /// The horizontal extent of this size. px
  static double get screenWidthPx => _screenWidth;

  /// The vertical extent of this size. px
  static double get screenHeightPx => _screenHeight;

  /// The offset from the top
  static double get statusBarHeight => _statusBarHeight / _pixelRatio;

  /// The offset from the top
  static double get statusBarHeightPx => _statusBarHeight;

  /// The offset from the bottom.
  static double get bottomBarHeight => _bottomBarHeight;

  /// The ratio of the actual dp to the design draft px
  double get scaleWidth => screenWidth / uiWidthPx;

  double get scaleHeight =>
      (_screenHeight - _statusBarHeight - _bottomBarHeight) / uiHeightPx;

  double get scaleText => scaleWidth;

  /// Width function
  /// Adapted to the device width of the UI Design.
  /// Height can also be adapted according to this to ensure no deformation,
  /// if you want a square
  double setWidth(double width) => width * scaleWidth;

  /// Height function
  /// Highly adaptable to the device according to UI Design.
  /// It is recommended to use this method to achieve a high degree of adaptation
  /// when it is found that one screen in the UI design
  /// does not match the current style effect, or if there is a difference in shape.
  double setHeight(double height) => height * scaleHeight;

  /// FontSize function
  /// @param [fontSize] UI in px.
  /// Font size adaptation method
  /// @param [fontSize] The size of the font on the UI design, in px.
  /// @param [allowFontScaling]
  double setSp(double fontSize, {bool? allowFontScalingSelf}) {
    return (allowFontScalingSelf ?? allowFontScaling)
        ? (fontSize * scaleText)
        : ((fontSize * scaleText) / _textScaleFactor);
  }
}
