
import 'package:equatable/equatable.dart';

class MoviesParams extends Equatable{
  final int id;
   const MoviesParams(this.id);

  @override
  
  List<Object?> get props => [id];


}