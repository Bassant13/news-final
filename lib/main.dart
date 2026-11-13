import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_final/providers/language_provider.dart';
import 'package:news_app_final/providers/theme_provider.dart';
import 'package:news_app_final/ui/core/assets/themes/dark_theme.dart';
import 'package:news_app_final/ui/core/assets/themes/light_theme.dart';
import 'package:news_app_final/ui/cubit/news_cubit.dart';
import 'package:news_app_final/ui/screens/home.dart';
import 'package:news_app_final/ui/screens/news_details.dart';
import 'package:news_app_final/ui/screens/news_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => LanguageProvider(),
        ),
        BlocProvider(
          create: (_) => NewsCubit(),
        ),
      ],
      child: const MyApp(),
    ),
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (builder,child){
        return   MaterialApp(
          title: 'News App',
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: context.watch<ThemeProvider>().currentTheme,
          localizationsDelegates: [
            AppLocalizations.delegate, // Add this line
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('en'),
            Locale('ar'),
          ],
          locale: Locale(context.watch<LanguageProvider>().currentLocale),
          initialRoute: Home.routeName,
          routes: {
            Home.routeName: (_) => Home(),
            NewsScreen.routeName: (_) => NewsScreen(),
            NewsDetails.routeName: (_) => NewsDetails(),

          },
        );
      },

    );
  }
}


