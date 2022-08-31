import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/business_screen/business_screen.dart';
import 'package:news_app/modules/health_screen/health_screen.dart';
import 'package:news_app/modules/sport_screen/sport_screen.dart';
import 'package:news_app/modules/technology_screen/technology_screen.dart';

import '../../modules/science_screen/science_screen.dart';
import '../components/constants.dart';
import '../networks/remote/dio_helper.dart';
import 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of(context);
  DioHelper dio = DioHelper();
  var currentIndex = 0;

  List<Widget> screen = [
    const SportsScreen(),
    const BusinessScreen(),
    const ScienceScreen(),
    const HealthScreen(),
    const TechnologyScreen(),
  ];

  List<String> title = [
    'أخبار الرياضة',
    'أخبار المال و الأعمال',
    'أخبار العلوم',
    'أخبار الصحة',
    'أخبار التكنولوجيا',
  ];
  List<BottomNavigationBarItem> navBarItem = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.sports_soccer_outlined),
      label: 'الرياضة',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.monetization_on_outlined),
      label: 'المال و الاعمال',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.science_outlined),
      label: 'العلوم',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.health_and_safety_outlined),
      label: 'الصحة',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.phone_iphone_outlined),
      label: 'التكنولوجيا',
    ),
  ];

  void navBarChange(int index) {
    currentIndex = index;
    if (index == 1) {
      const BusinessScreen();
    }
    if (index == 2) {
      const ScienceScreen();
    }
    if (index == 3) {
      const HealthScreen();
    }
    if (index == 4) {
      const TechnologyScreen();
    }
    emit(NavBarChange());
  }

  List<dynamic> all = [];

  void getAllDate() {
    emit(AllDateLoading());
    if (all.isEmpty) {
      dio.getDataFromApi(url: method, query: queryOfAllData).then((value) {
        all = value.data['articles'];
        emit(AllDataSuccess());
      }).catchError((onError) {
        if (kDebugMode) {
          print(onError.toString());
        }
        emit(AllDataFail());
      });
    } else {
      emit(AllDataSuccess());
    }
  }

  List<dynamic> sports = [];

  void getSportsDate() {
    emit(SportsDateLoading());
    if (sports.isEmpty) {
      dio.getDataFromApi(url: method, query: queryOfSportsData).then((value) {
        sports = value.data['articles'];
        emit(SportsDataSuccess());
      }).catchError((onError) {
        if (kDebugMode) {
          print(onError.toString());
        }
        emit(SportsDataFail());
      });
    } else {
      emit(SportsDataSuccess());
    }
  }

  List<dynamic> business = [];

  void getBusinessDate() {
    if (business.isEmpty) {
      emit(BusinessDateLoading());
      dio.getDataFromApi(url: method, query: queryOfBusinessData).then((value) {
        business = value.data['articles'];
        emit(BusinessDataSuccess());
      }).catchError((onError) {
        if (kDebugMode) {
          print(onError.toString());
        }
        emit(BusinessDataFail());
      });
    } else {
      emit(BusinessDataSuccess());
    }
  }

  List<dynamic> science = [];

  void getScienceDate() {
    if (science.isEmpty) {
      emit(ScienceDateLoading());
      dio.getDataFromApi(url: method, query: queryOfScienceData).then((value) {
        science = value.data['articles'];
        emit(ScienceDataSuccess());
      }).catchError((onError) {
        if (kDebugMode) {
          print(onError.toString());
        }
        emit(ScienceDataFail());
      });
    } else {
      emit(ScienceDataSuccess());
    }
  }

  List<dynamic> health = [];

  void getHealthDate() {
    if (health.isEmpty) {
      emit(HealthDateLoading());
      dio.getDataFromApi(url: method, query: queryOfHealthData).then((value) {
        health = value.data['articles'];
        emit(HealthDataSuccess());
      }).catchError((onError) {
        if (kDebugMode) {
          print(onError.toString());
        }
        emit(HealthDataFail());
      });
    } else {
      emit(HealthDataSuccess());
    }
  }

  List<dynamic> technology = [];

  void getTechnologyDate() {
    if (technology.isEmpty) {
      emit(TechnologyDateLoading());
      dio
          .getDataFromApi(url: method, query: queryOfTechnologyData)
          .then((value) {
        technology = value.data['articles'];
        emit(TechnologyDataSuccess());
      }).catchError((onError) {
        if (kDebugMode) {
          print(onError.toString());
        }
        emit(TechnologyDataFail());
      });
    } else {
      emit(TechnologyDataSuccess());
    }
  }

  int selectedItem = 0;

  void getSelectedItem(index) {
    selectedItem = index;
    emit(TechnologyGetSelectedItem());
  }

  bool isDesktop = false;

  void getDesktop(bool value) {
    isDesktop = value;
    emit(DesktopState());
  }

  List<dynamic> search = [];

  void getSearchDate(String value) {
    emit(SearchDateLoading());
    dio.getDataFromApi(
      url: 'v2/everything',
      query: {
        'q': value,
        'from': '2022-05-15',
        'sortBy': 'popularity',
        'apiKey': 'a6f4ecb307354436b4001fda99256018',
      },
    ).then((value) {
      search = value.data['articles'];
      emit(SearchDataSuccess());
    }).catchError((onError) {
      if (kDebugMode) {
        print(onError.toString());
      }
      emit(SearchDataFail());
    });
  }
}
