import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/di/get_it.dart' as getIt;
import 'package:movie_app/di/get_it.dart' as ScreenUtil;
import 'package:movie_app/presentation/widgets/movies_app.dart'; // Import your main widget

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Lock orientation to portrait mode
  unawaited(SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
  
  // Initialize dependencies and ScreenUtil
  unawaited(getIt.init());
  ScreenUtil.init();  // Initialize ScreenUtil without an alias
  
  runApp(MoviesApp());  // Start the app
}
