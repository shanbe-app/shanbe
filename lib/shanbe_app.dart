import 'package:client/pages/edit_lists_page.dart';
import 'package:client/pages/settings_page.dart';
import 'package:client/pages/space_page.dart';
import 'package:client/pages/init_page.dart';
import 'package:client/pages/signup_page.dart';
import 'package:client/pages/spaces_page.dart';
import 'package:client/rx/blocs/settings_bloc.dart';
import 'package:client/rx/service_provider.dart';
import 'package:client/types/space_page_arguments.dart';
import 'package:client/utils/constants.dart';
import 'package:client/utils/utils.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class ShanbeApp extends StatefulWidget {
  const ShanbeApp({Key? key}) : super(key: key);

  @override
  _ShanbeAppState createState() => _ShanbeAppState();
}

class _ShanbeAppState extends State<ShanbeApp> {
  late Future<void> appInitFuture;
  late ServiceProvider serviceProvider;
  late SettingsBloc settingsBloc;

  Locale locale = Constants.DEFAULT_LOCALE;
  ThemeMode theme = Constants.DEFAULT_THEME;

  @override
  void initState() {
    super.initState();
    appInitFuture = bootstrapApp();
  }

  Future<void> bootstrapApp() async {
    serviceProvider = ServiceProvider();
    try {
      await serviceProvider.onCreate();
      serviceProvider.setThemeChangeListener((event) {
        setState(() {
          theme = event;
        });
      });
      serviceProvider.setLocaleChangeListener((event) {
        setState(() {
          locale = event;
        });
      });
      settingsBloc = SettingsBloc(serviceProvider.storageService);
      setState(() {
        theme = settingsBloc.currentTheme();
        locale = settingsBloc.currentLocale();
      });
    } catch (e, stack) {
      FirebaseCrashlytics.instance.recordError(e, stack);
    }
  }

  @override
  void dispose() {
    super.dispose();
    serviceProvider.onTerminate();
  }

  @override
  Widget build(BuildContext context) {
    return PlatformApp(
      key: GlobalKey(debugLabel: 'shanbeApp'),
      showSemanticsDebugger: false,
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: locale,
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
      onGenerateTitle: (context) => AppLocalizations.of(context)!.title,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return platformPageRoute(
                context: context,
                builder: (context) => InitPage(
                      appInitFuture: appInitFuture,
                    ));
          case '/space':
            return platformPageRoute(
                context: context,
                builder: (context) => SpacePage(
                    arguments: settings.arguments as SpacePageArguments,
                    context: context));
          case '/spaces':
            return platformPageRoute(
                context: context,
                builder: (context) => SpacesPage(
                      context: context,
                    ));
          case '/settings':
            return platformPageRoute(
                context: context,
                builder: (context) => SettingsPage(
                      context: context,
                    ));
          case '/edit-lists':
            return platformPageRoute(
                context: context, builder: (context) => const EditListsPage());
          case '/signup':
            return platformPageRoute(
                context: context,
                builder: (context) => SignupPage(
                      context: context,
                    ));
          default:
            return null;
        }
      },
      cupertino: (context, target) => CupertinoAppData(
          theme: CupertinoThemeData(
        brightness: themeModeToBrightness(theme),
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
              fontSize: Constants.CAPTION_FONT_SIZE,
              color: CupertinoColors.inactiveGray,
              fontWeight: Constants.MEDIUM_FONT_WEIGHT),
          navTitleTextStyle: const TextStyle(
              fontFamily: Constants.APPLICATION_DEFAULT_FONT,
              fontFamilyFallback: Constants.APPLICATION_FALLBACK_FONTS,
              fontSize: Constants.H5_FONT_SIZE,
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
          themeMode: theme,
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
              cardTheme: CardTheme(shape: Constants.CARD_SHAPE, elevation: 4),
              colorScheme: Theme.of(context)
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
              cardTheme: CardTheme(shape: Constants.CARD_SHAPE, elevation: 4),
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
