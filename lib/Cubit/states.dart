import 'package:news_application/Network/DioHelper.dart';

abstract class AppStates{}

class AppInitialState extends AppStates{}

class AppBottomNavBarState extends AppStates{}

class AppLoadingState extends AppStates{}

class AppGetBusinessDataState extends AppStates{}

class AppErrorGetBusinessDataState extends AppStates{
  final String error;
  AppErrorGetBusinessDataState(this.error);
}

class AppGetScienceDataState extends AppStates{}

class AppErrorGetScienceDataState extends AppStates{
  final String error;
  AppErrorGetScienceDataState(this.error);
}

class AppGetSportsDataState extends AppStates{}

class AppErrorGetSportsDataState extends AppStates{
  final String error;
  AppErrorGetSportsDataState(this.error);
}

class AppChangeThemeState extends AppStates{}

class AppSearchState extends AppStates{}

class AppSearchErrorState extends AppStates{
  final String error;
  AppSearchErrorState(this.error);
}









