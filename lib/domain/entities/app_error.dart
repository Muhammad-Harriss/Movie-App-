import 'package:equatable/equatable.dart';

enum AppErrorType {
  api,         // API request errors
  network,     // Internet connection issues
  database,    // Local database errors
  unauthorized,// Authentication errors
  unknown,     // Any other error
}

class AppError extends Equatable {
  final AppErrorType appErrorType;

  const AppError(this.appErrorType);

  @override
  List<Object> get props => [appErrorType];
}
