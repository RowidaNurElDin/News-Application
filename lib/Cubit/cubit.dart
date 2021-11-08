import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/Cubit/states.dart';
import 'package:news_application/Network/DioHelper.dart';
import 'package:news_application/Screens/BusinessScreen.dart';
import 'package:news_application/Screens/ScientificScreen.dart';
import 'package:news_application/Screens/SportsScreen.dart';
import 'package:news_application/Screens/SettingsScreen.dart';
import 'package:news_application/sharedPref.dart';


class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentindex = 0 ;

  void changeIndex(int index){
    currentindex = index ;
    if(currentindex == 1) getScienceData();
    else if(currentindex ==2) getSportsData();

    emit(AppBottomNavBarState());
  }

  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(icon: Icon(Icons.business_center_rounded), label: "Business"),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: "Science"),
    BottomNavigationBarItem(icon: Icon(Icons.sports_baseball_rounded), label: "Sports"),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
  ];

  List<Widget> newsappScreens =[
    BusinessScreen(),
    ScienceScreen(),
    SportsScreen(),
    SettingsScreen()
  ];

  List<dynamic> businessdata =[];

  void getBusinessData(){
    emit(AppLoadingState());

    if(businessdata.length == 0){

     DioHelper.getData(
         url: 'v2/top-headlines',
         query:
         {
           'country':'eg',
           'category':'business',
           'apikey':'37bd00d114a840d7867a8cdb525a7caf'
         }
     ).then((value){
       businessdata = value.data['articles'];
       emit(AppGetBusinessDataState());
     }).catchError((error){
       print(error.toString());
       emit(AppErrorGetBusinessDataState(error.toString()));
     });
   }else{
     emit(AppGetBusinessDataState());
   }

  }

  List<dynamic> sciencedata =[];

  void getScienceData(){
    emit(AppLoadingState());

    if(sciencedata.length == 0){

      DioHelper.getData(
          url: 'v2/top-headlines',
          query:
          {
            'country':'eg',
            'category':'science',
            'apikey':'37bd00d114a840d7867a8cdb525a7caf'
          }
      ).then((value){
        sciencedata = value.data['articles'];
        emit(AppGetScienceDataState());
      }).catchError((error){
        print(error.toString());
        emit(AppErrorGetScienceDataState(error.toString()));
      });
    }else{
      emit(AppGetScienceDataState());
    }
  }

  List<dynamic> sportsdata =[];

  void getSportsData(){
    emit(AppLoadingState());

    if(sportsdata.length == 0){

      DioHelper.getData(
          url: 'v2/top-headlines',
          query:
          {
            'country':'eg',
            'category':'sports',
            'apikey':'37bd00d114a840d7867a8cdb525a7caf'
          }
      ).then((value){
        sportsdata = value.data['articles'];
        emit(AppGetSportsDataState());
      }).catchError((error){
        print(error.toString());
        emit(AppErrorGetSportsDataState(error.toString()));
      });
    }else{
      emit(AppGetSportsDataState());
    }
  }


  List<dynamic> searchdata =[];

  void Search(String value){


    emit(AppLoadingState());
    DioHelper.getData(
        url: 'v2/everything',
        query:
        {
          'q':'$value',
          'from':'2021-08-12',
          'sortBy':'publishedAt',
          'apiKey':'37bd00d114a840d7867a8cdb525a7caf'
        }
    ).then((value){
      searchdata = value.data['articles'];
      emit(AppSearchState());
    }).catchError((error){
      print(error.toString());
      emit(AppSearchErrorState(error.toString()));
    });
  }

  bool isDark = false ;

  void changeTheme({bool? fromShared}){

    if(fromShared != null)
      isDark = fromShared;
    else
      isDark = !isDark ;
    sharedPrefrences.addData(key: 'isDark', value: isDark).then(
            (value) {
              emit(AppChangeThemeState());
            }
    );
  }

}