import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:news_app/shared/cubit/app_cubit.dart';
import 'package:news_app/shared/cubit/bloc_observer.dart';
import 'package:news_app/shared/cubit_for_main/main_cubit.dart';
import 'package:news_app/shared/cubit_for_main/main_state.dart';
import 'package:news_app/shared/styles/theme_service.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'layouts/home.dart';

void main() async {
  BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await GetStorage.init();
      runApp(MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  MyApp({
    Key? key,
  }) : super(key: key);
  final ThemeService theme = ThemeService();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MainCubit(),
        ),
        BlocProvider(
          create: (context) => AppCubit(),
        ),
      ],
      child: BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {},
        builder: (context, state) {
          return GetMaterialApp(
            theme: theme.light,
            darkTheme: theme.dark,
            themeMode: theme.getThemeMode(),
            debugShowCheckedModeBanner: false,
            home: ScreenTypeLayout.builder(
              mobile: (BuildContext context) => const Home(),
              desktop: (BuildContext context) => Home(),
              tablet: (BuildContext context) => Home(),
              breakpoints: ScreenBreakpoints(
                tablet: 600,
                desktop: 950,
                watch: 300,
              ),
            ),
          );
        },
      ),
    );
  }
}
