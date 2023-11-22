import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyAppLocalizations {
  static late AppLocalizations instance;
  static late String language;

  /// Il faut absolument l'appeler avant de lancer l'appli
  static initLocale() async {
    final parts = Platform.localeName.split("_");
    final locale = Locale(parts.first, parts.last);
    language = parts.first;
    instance = await AppLocalizations.delegate.load(locale);
  }
}
