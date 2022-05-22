import 'dart:io';

import 'package:client/pages/edit_lists_page.dart';
import 'package:client/pages/lists_page.dart';
import 'package:client/utils/constants.dart';
import 'package:client/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:client/pages/root_page.dart';
import 'package:client/rx/services/app_service.dart';

class ShanbeApp extends StatefulWidget {
  const ShanbeApp({Key? key}) : super(key: key);

  @override
  _ShanbeAppState createState() => _ShanbeAppState();
}

class _ShanbeAppState extends State<ShanbeApp> {
  late Future<void> appInitFuture;
  late AppService appService;

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    appInitFuture = bootstrapApp();
  }

  Future<void> bootstrapApp() async {
    appService = AppService();
    await appService.onCreate();
  }

  @override
  void dispose() {
    super.dispose();
    appService.onTerminate();
  }

  @override
  Widget build(BuildContext context) {
    return PlatformApp(
      key: GlobalKey(debugLabel: 'shanbeApp'),
      showSemanticsDebugger: false,
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale.fromSubtags(languageCode: 'en'),
        Locale.fromSubtags(languageCode: 'fa')
      ],
      locale: Locale(languageCodeFromLocaleName(Platform.localeName),
          countryFromLocaleName(Platform.localeName)),
      localeResolutionCallback:
          (Locale? locale, Iterable<Locale> supportedLocales) {
        for (var element in supportedLocales) {
          if (element.languageCode == locale?.languageCode) {
            return element;
          }
        }
        return const Locale.fromSubtags(languageCode: 'en');
      },
      navigatorObservers: const [],
      initialRoute: '/',
      onGenerateTitle: (context) => AppLocalizations.of(context).title,
      onGenerateRoute: (settings) {
        print('ongenrateroute ${settings.name}');
        switch (settings.name) {
          case '/':
            return platformPageRoute(
                context: context,
                builder: (context) => RootPage(
                      appInitFuture: appInitFuture,
                    ));
          case '/lists':
            return platformPageRoute(
                context: context, builder: (context) => const ListsPage());
          case '/edit-lists':
            return platformPageRoute(
                context: context, builder: (context) => const EditListsPage());
          default:
            return null;
        }
      },
      cupertino: (context, target) => CupertinoAppData(
          theme: CupertinoThemeData(
        brightness: Brightness.light,
        primaryColor: Constants.PRIMARY_COLOR,
        primaryContrastingColor: Colors.white,
        scaffoldBackgroundColor: Constants.BACKGROUND_COLOR,
        textTheme: CupertinoTextThemeData(
          primaryColor: Constants.PRIMARY_COLOR,
          textStyle: const TextStyle(
            color: Constants.TEXT_BODY_COLOR,
            fontSize: Constants.S1_FONT_SIZE,
            fontFamily: Constants.APPLICATION_DEFAULT_FONT,
            fontFamilyFallback: Constants.APPLICATION_FALLBACK_FONTS,
            fontWeight: Constants.REGULAR_FONT_WEIGHT,
          ),
          tabLabelTextStyle: const TextStyle(
              fontFamily: Constants.APPLICATION_DEFAULT_FONT,
              fontFamilyFallback: Constants.APPLICATION_FALLBACK_FONTS,
              fontSize: Constants.S2_FONT_SIZE,
              color: CupertinoColors.inactiveGray,
              fontWeight: Constants.MEDIUM_FONT_WEIGHT),
          navTitleTextStyle: const TextStyle(
              fontFamily: Constants.APPLICATION_DEFAULT_FONT,
              fontFamilyFallback: Constants.APPLICATION_FALLBACK_FONTS,
              fontSize: Constants.S1_FONT_SIZE,
              color: Constants.TEXT_BLACK_COLOR,
              fontWeight: Constants.DEMI_BOLD_FONT_WEIGHT),
          actionTextStyle: const TextStyle(
            color: CupertinoColors.activeBlue,
            fontSize: Constants.S1_FONT_SIZE,
            fontFamily: Constants.APPLICATION_DEFAULT_FONT,
            fontFamilyFallback: Constants.APPLICATION_FALLBACK_FONTS,
            fontWeight: Constants.REGULAR_FONT_WEIGHT,
          ),
          navActionTextStyle: const TextStyle(
            color: CupertinoColors.activeBlue,
            fontSize: Constants.S1_FONT_SIZE,
            fontFamily: Constants.APPLICATION_DEFAULT_FONT,
            fontFamilyFallback: Constants.APPLICATION_FALLBACK_FONTS,
            fontWeight: Constants.REGULAR_FONT_WEIGHT,
          ),
          navLargeTitleTextStyle: const TextStyle(
            color: Constants.TEXT_BLACK_COLOR,
            fontSize: Constants.H1_FONT_SIZE,
            fontFamily: Constants.APPLICATION_DEFAULT_FONT,
            fontFamilyFallback: Constants.APPLICATION_FALLBACK_FONTS,
            fontWeight: Constants.BOLD_FONT_WEIGHT,
          ),
          pickerTextStyle: const TextStyle(
            color: Constants.TEXT_BODY_COLOR,
            fontSize: Constants.S1_FONT_SIZE,
            fontFamily: Constants.APPLICATION_DEFAULT_FONT,
            fontFamilyFallback: Constants.APPLICATION_FALLBACK_FONTS,
            fontWeight: Constants.REGULAR_FONT_WEIGHT,
          ),
          dateTimePickerTextStyle: const TextStyle(
            color: Constants.TEXT_BODY_COLOR,
            fontSize: Constants.S1_FONT_SIZE,
            fontFamily: Constants.APPLICATION_DEFAULT_FONT,
            fontFamilyFallback: Constants.APPLICATION_FALLBACK_FONTS,
            fontWeight: Constants.REGULAR_FONT_WEIGHT,
          ),
        ),
      )),
      material: (context, target) => MaterialAppData(
          darkTheme: ThemeData(
              brightness: Brightness.dark,
              toggleableActiveColor: Constants.SECONDARY_COLOR,
              primarySwatch: Colors.blue,
              primaryColor: Constants.PRIMARY_COLOR,
              accentColor: Constants.SECONDARY_COLOR,
              // canvasColor: Constants.BACKGROUND_COLOR,
              scaffoldBackgroundColor: Constants.BACKGROUND_COLOR_DARK,
              fontFamily: Constants.APPLICATION_DEFAULT_FONT,
              errorColor: Constants.ERROR_COLOR,
              dividerColor: Constants.LINE_COLOR_DARK,
              elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(
                      primary: Constants.PRIMARY_COLOR_DARK,
                      onPrimary: Colors.white,
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontFamily: Constants.APPLICATION_DEFAULT_FONT),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)))),
              buttonTheme: ButtonThemeData(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              dialogTheme: DialogTheme(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24))),
              snackBarTheme: const SnackBarThemeData(
                  backgroundColor: Constants.BACKGROUND_COLOR,
                  contentTextStyle: TextStyle(
                      color: Constants.TEXT_BODY_COLOR,
                      fontSize: Constants.S2_FONT_SIZE,
                      fontFamily: Constants.APPLICATION_DEFAULT_FONT),
                  behavior: SnackBarBehavior.floating),
              bottomSheetTheme: const BottomSheetThemeData(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(24)))),
              textTheme: Theme.of(context).textTheme.apply(
                  fontFamily: Constants.APPLICATION_DEFAULT_FONT,
                  bodyColor: Constants.TEXT_BODY_COLOR_DARK,
                  displayColor: Constants.TEXT_BODY_COLOR_DARK)),
          theme: ThemeData(
              primarySwatch: Colors.blue,
              primaryColor: Constants.PRIMARY_COLOR,
              accentColor: Constants.SECONDARY_COLOR,
              // canvasColor: Constants.BACKGROUND_COLOR,
              fontFamily: Constants.APPLICATION_DEFAULT_FONT,
              errorColor: Constants.ERROR_COLOR,
              toggleableActiveColor: Constants.SECONDARY_COLOR,
              dividerColor: Constants.LINE_COLOR,
              scaffoldBackgroundColor: Constants.BACKGROUND_COLOR,
              colorScheme: Theme.of(context) // Todo Need consideration
                  .colorScheme
                  .copyWith(secondary: Constants.SECONDARY_COLOR),
              elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(
                      primary: Constants.PRIMARY_COLOR_DARK,
                      onPrimary: Colors.white,
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontFamily: Constants.APPLICATION_DEFAULT_FONT),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)))),
              buttonTheme: ButtonThemeData(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              dialogTheme: DialogTheme(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24))),
              snackBarTheme: const SnackBarThemeData(
                  backgroundColor: Constants.BACKGROUND_COLOR_DARK,
                  contentTextStyle: TextStyle(
                      color: Constants.TEXT_BODY_COLOR_DARK,
                      fontSize: Constants.S2_FONT_SIZE,
                      fontFamily: Constants.APPLICATION_DEFAULT_FONT),
                  behavior: SnackBarBehavior.floating),
//              scaffoldBackgroundColor: Colors.white,
              bottomSheetTheme: const BottomSheetThemeData(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(24)))),
              textTheme: Theme.of(context).textTheme.apply(
                  fontFamily: Constants.APPLICATION_DEFAULT_FONT,
                  bodyColor: Constants.TEXT_BODY_COLOR,
                  displayColor: Constants.TEXT_BODY_COLOR))),
    );
  }
}
