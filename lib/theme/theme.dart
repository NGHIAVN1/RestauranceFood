import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:main/screens/homepage.dart';
import 'package:main/screens/login.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:main/components/country_picker.dart';
class SwitchThemes extends StatelessWidget {
  const SwitchThemes({super.key});

  @override
  Widget build(BuildContext context) {
        Map<String, dynamic> localizationData = countriesPicker();

    return ThemeProvider(
        saveThemesOnChange: true,
        loadThemeOnInit: false,
        onInitCallback: (controller, previouslySavedThemeFuture) async {
          final view = View.of(context);
          String? savedTheme = await previouslySavedThemeFuture;
          if (savedTheme != null) {
            controller.setTheme(savedTheme);
          } else {
            Brightness platformBrightness =
                // ignore: use_build_context_synchronously
                view.platformDispatcher.platformBrightness;
            if (platformBrightness == Brightness.dark) {
              controller;
            } else {
              controller.setTheme('light');
            }
            controller.forgetSavedTheme();
          }
        },
        themes: [
          AppTheme.dark(id: 'dark'),
          AppTheme.light(id: 'light'),
        ],
        child: ThemeConsumer(
          child: Builder(
              builder: (themeContext) => MaterialApp(
                    localizationsDelegates: [
                          GlobalMaterialLocalizations.delegate,
                          GlobalWidgetsLocalizations.delegate,
                          CountryLocalizations.delegate,],
                    supportedLocales: const [
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
                    initialRoute: '/',
                    routes: {
                      '/': (context) => HomePage(),
                      '/login': (context)=>LoginPage()
                    },
                     theme: ThemeProvider.themeOf(themeContext).data,
                    
                  )),
        ));
  }
}
