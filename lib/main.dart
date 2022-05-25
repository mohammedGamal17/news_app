import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:news_app/shared/cubit/app_cubit.dart';
import 'package:news_app/shared/cubit/bloc_observer.dart';
import 'package:news_app/shared/cubit_for_main/main_cubit.dart';
import 'package:news_app/shared/cubit_for_main/main_state.dart';
import 'package:news_app/shared/styles/colors.dart';

import 'layouts/home.dart';

void main() async {
  BlocOverrides.runZoned(
    () async {
      //await GetStorage.init();
      WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
      FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
      runApp(MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  MyApp({
    Key? key,
  }) : super(key: key);
  final UiColor theme = UiColor();

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
          var cubit = MainCubit.get(context);
          return MaterialApp(
            theme: theme.light,
            darkTheme: theme.dark,
            themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home: const Home(),
          );
        },
      ),
    );
  }
}
