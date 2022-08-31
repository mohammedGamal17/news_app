import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:news_app/shared/cubit/app_cubit.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../shared/components/components.dart';
import '../../shared/cubit/app_state.dart';

class TechnologyScreen extends StatelessWidget {
  const TechnologyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getTechnologyDate(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          var list = cubit.technology;
          return Scaffold(
            body: ScreenTypeLayout(
              mobile: Builder(
                builder: (context) {
                  cubit.getDesktop(false);
                  return list.isNotEmpty
                      ? ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) =>
                              data(list[index], context, index),
                          separatorBuilder: (context, index) => separator(),
                          itemCount: list.length,
                        )
                      : circularProgressIndicator();
                },
              ),
              desktop: Builder(
                builder: (context) {
                  cubit.getDesktop(true);
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: list.isNotEmpty
                            ? ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) =>
                                    data(list[index], context, index),
                                separatorBuilder: (context, index) =>
                                    separator(),
                                itemCount: list.length,
                              )
                            : circularProgressIndicator(),
                      ),
                      if (list.isNotEmpty)
                        Expanded(
                          child: Container(
                            color: Colors.grey[400],
                            height: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Image(image: NetworkImage('${list[cubit.selectedItem]['urlToImage']}')),
                                  SizedBox(height: 10.0),
                                  Text(
                                    '${list[cubit.selectedItem]['description']}',
                                    style: TextStyle(fontSize: 18.0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
              breakpoints: ScreenBreakpoints(
                desktop: 600.0,
                tablet: 600.0,
                watch: 100.0,
              ),
            ),
          );
        },
      ),
    );
  }
}
