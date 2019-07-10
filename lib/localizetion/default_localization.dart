import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide Action;

import 'data/abstract_locale_string.dart';
import 'data/locale_string_en.dart';
import 'data/locale_string_zh.dart';

class DefaultLocalizations {
  final Locale locale;

  DefaultLocalizations(this.locale);

  AbstractLocaleString get localeString =>
      _localizedValues[locale.languageCode];

  static Map<String, AbstractLocaleString> _localizedValues = {
    'en': new LocaleStringEn(),
    'zh': new LocaleStringZh(),
  };

  static AbstractLocaleString of(BuildContext context) {
    return Localizations.of<DefaultLocalizations>(context, DefaultLocalizations)
        .localeString;
  }
}
