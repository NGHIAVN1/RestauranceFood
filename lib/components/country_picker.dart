import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:country_picker/country_picker.dart';
import 'package:main/theme/theme.dart';
Map<String, dynamic> countriesPicker() {
  return {
    'localizationsDelegates': [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      // Assuming CountryLocalizations is defined elsewhere in your project
      CountryLocalizations.delegate,
    ],
    'supportedLocales': const [
      Locale('en'),
      Locale('ar'),
      Locale('es'),
      Locale('de'),
      Locale('fr'),
      Locale('el'),
      Locale('et'),
      Locale('nb'),
      Locale('nn'),
      Locale('pl'),
      Locale('pt'),
      Locale('ru'),
      Locale('hi'),
      Locale('ne'),
      Locale('uk'),
      Locale('hr'),
      Locale('tr'),
      Locale('lv'),
      Locale('lt'),
      Locale('ku'),
      Locale('nl'),
      Locale('it'),
      Locale('ko'),
      Locale('ja'),
      Locale('id'),
      Locale('cs'),
      Locale('ht'),
      Locale('sk'),
      Locale('ro'),
      Locale('bg'),
      Locale('ca'),
      Locale('vn'),
      Locale('he'),
    ],
    
  };
  // Use the options variable as needed
}
