import 'package:movie_app/domain/entities/language_entity.dart';

class Languages {
  Languages._(); 

  static final List<LanguageEntity> languages = [
    LanguageEntity(code: 'en', value: '   English'),
    LanguageEntity(code: 'es', value: '   Spanish'),
  ];
} 
