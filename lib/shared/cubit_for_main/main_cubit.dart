import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/networks/local/cache_helper.dart';

import 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());

  static MainCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void getDarkMode() {
    isDark = !isDark;
    emit(GetDarkMode());
  }
}
