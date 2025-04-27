import 'package:flutter/material.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/common/constants/translation_constanats.dart';
import 'package:movie_app/common/extension/string_extension.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/presentation/widgets/button.dart';
import 'package:wiredash/wiredash.dart';

class AppErrorWiget extends StatelessWidget {
  final AppErrorType errorType;
  final VoidCallback onPressed;

  const AppErrorWiget({
    super.key,
    required this.errorType,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.dimen_32),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            errorType == AppErrorType.api
                ? TranslationConstants.somethingWentWrong.t(context)
                : TranslationConstants.ChatchNetwork.t(context),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          ButtonBar(
            children: [
              Button(text: TranslationConstants.retry, onPressed: onPressed),
              Button(
                text: TranslationConstants.feedback,
                onPressed: () => Wiredash.of(context).show(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
