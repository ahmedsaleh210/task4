import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:task_4/cubit/cubit.dart';
import 'package:task_4/shared/BlocObserver.dart';

import 'cubit/states.dart';
import 'modules/FirstScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await translator.init(
    localeType: LocalizationDefaultType.device,
    languagesList: <String>['ar', 'en'],
    assetsDirectory: 'assets/lang/',
  );


  BlocOverrides.runZoned(
        () {
          runApp(
            LocalizedApp(
              child: const MyApp(),
            ),
          );    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) { return AppCubit(); },
      child: BlocConsumer<AppCubit,AppLayoutStates>(
        listener: (context,state) {},
        builder:  (context,state) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                elevation: 0.0,
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                iconTheme: IconThemeData(
                    color: Colors.black
                ),
              ),
              primarySwatch: Colors.orange,
              textTheme: const TextTheme(

              ),
            ),
            debugShowCheckedModeBanner: false,
            home: const FirstScreen(),
            localizationsDelegates: translator.delegates, // Android + iOS Delegates
            locale: translator.activeLocale, // Active locale
            supportedLocales: translator.locals(),
          );
        }
      ),
    );
  }
}

