// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myday/providers/provider.dart';
import 'package:myday/screens/splash_screen/splash_screen.dart';
import 'package:myday/shared/styles/my_theme.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'layout/home_layout.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:device_preview/device_preview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// [initialization before run app you should most add this line]
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await FirebaseFirestore.instance.disableNetwork();
  runApp(
    ChangeNotifierProvider<MProvider>(
      create: (context) => MProvider(),
      child: const MyApp(),
    ),
  );
  // runApp(
  //   ChangeNotifierProvider<MProvider>(
  //     create: (context) => MProvider(),
  //     child: DevicePreview(
  //       builder: (context) => const MyApp(), // Wrap your app
  //     ),
  //   ),
  // );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MProvider>(context);

    return MaterialApp(
      title: 'Flutter Demo',

      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: Locale(provider.languageCode),
      supportedLocales: const [
        Locale('en'), // English
        Locale('ar'), // Arabic
        // Locale('ar','eg'), // Arabic ,Egypt
        // Locale('ar','sa'), // Arabic ,Saudi Arabia
      ],
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        HomeLayout.routeName: (context) => const HomeLayout(),
        // EditTap.routeName: (context) =>  EditTap(),
      },
    );
  }
}
