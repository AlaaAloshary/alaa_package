import 'package:alaa_package/StyleClasses/AlaaStyle.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlaaMaterialApp extends GetMaterialApp {
  AlaaMaterialApp({
    super.key,
    super.navigatorKey,
    super.scaffoldMessengerKey,
    super.home,
    Map<String, Widget Function(BuildContext)> super.routes =
        const <String, WidgetBuilder>{},
    super.initialRoute,
    super.onGenerateRoute,
    super.onGenerateInitialRoutes,
    super.onUnknownRoute,
    super.useInheritedMediaQuery = false,
    List<NavigatorObserver> super.navigatorObservers =
        const <NavigatorObserver>[],
    super.builder,
    super.textDirection,
    super.title = '',
    super.onGenerateTitle,
    super.color,
    ThemeData? theme,
    // super.theme,
    super.darkTheme,
    super.themeMode = ThemeMode.system,
    super.locale,
    super.fallbackLocale,
    super.localizationsDelegates,
    super.localeListResolutionCallback,
    super.localeResolutionCallback,
    super.supportedLocales = const <Locale>[Locale('en', 'US')],
    super.debugShowMaterialGrid = false,
    super.showPerformanceOverlay = false,
    super.checkerboardRasterCacheImages = false,
    super.checkerboardOffscreenLayers = false,
    super.showSemanticsDebugger = false,
    super.debugShowCheckedModeBanner = true,
    super.shortcuts,
    super.scrollBehavior,
    super.customTransition,
    super.translationsKeys,
    super.translations,
    super.onInit,
    super.onReady,
    super.onDispose,
    super.routingCallback,
    super.defaultTransition,
    super.getPages,
    super.opaqueRoute,
    super.enableLog = kDebugMode,
    super.logWriterCallback,
    super.popGesture,
    super.transitionDuration,
    super.defaultGlobalState,
    super.smartManagement = SmartManagement.full,
    super.initialBinding,
    super.unknownRoute,
    super.highContrastTheme,
    super.highContrastDarkTheme,
    super.actions,
  }) : super(
            theme: theme ??
                ThemeData(
                  scaffoldBackgroundColor: AlaaStyle.style.accentColor,

                  colorScheme:
                      ColorScheme.fromSeed(seedColor: AlaaStyle.style.mainColor),
                  useMaterial3: true,
                ));
}

class aaa extends StatelessWidget {
  const aaa({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp();
  }
}
