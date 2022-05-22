import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/app_cubit.dart';

import '../../shared/components/components.dart';
import '../../shared/cubit/app_state.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  final TextEditingController searchEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = AppCubit.get(context).search;
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: AppBar(),
              body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    textFormField(
                      labelText: 'بحث',
                      textDirection: TextDirection.rtl,
                      prefix: Icons.search_outlined,
                      validate: (String value) {
                        if (value.isEmpty) {
                          return "Search Can't be Empty";
                        }
                      },
                      controller: searchEditController,
                      autoFocus: true,
                      onChange: (value) {
                        AppCubit.get(context).getSearchDate(value);
                      },
                    ),
                    Expanded(
                      child: Container(
                        child: list.isNotEmpty
                            ? ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) =>
                                    data(list[index], context),
                                separatorBuilder: (context, index) =>
                                    separator(),
                                itemCount: list.length,
                              )
                            : Center(
                                child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.search_rounded,
                                    size: 60.0,
                                  ),
                                ],
                              )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
