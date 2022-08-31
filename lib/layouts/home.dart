import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit_for_main/main_cubit.dart';

import '../modules/search_screen/search_screen.dart';
import '../shared/components/components.dart';
import '../shared/cubit/app_cubit.dart';
import '../shared/cubit/app_state.dart';
import '../shared/styles/theme_service.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: () {
                    navigateTo(context,SearchScreen());
                  },
                  icon: const Icon(Icons.search),
                ),
                IconButton(
                  onPressed: () {
                    ThemeService().changeTheme();
                  },
                  icon: const Icon(Icons.dark_mode),
                )
              ],
              title: Text(cubit.title[cubit.currentIndex]),
            ),
            body: cubit.screen[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                cubit.navBarChange(index);
              },
              items: cubit.navBarItem,
            ),
          ),
        );
      },
    );
  }
}
