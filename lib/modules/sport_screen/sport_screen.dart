import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/app_cubit.dart';

import '../../shared/components/components.dart';
import '../../shared/cubit/app_state.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      AppCubit()
        ..getSportsDate(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = AppCubit
              .get(context)
              .sports;
          return Scaffold(
              body: list.isNotEmpty
                  ? ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => data(list[index],context),
                separatorBuilder: (context, index) => separator(),
                itemCount: list.length,
              )
                  : circularProgressIndicator(),

          );
        },
      ),
    );
  }
}