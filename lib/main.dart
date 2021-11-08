
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/Cubit/cubit.dart';
import 'package:news_application/Network/DioHelper.dart';
import 'package:news_application/Screens/HomeScreen.dart';
import 'package:news_application/sharedPref.dart';

import 'Cubit/states.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await sharedPrefrences.init();
  DioHelper.init();
  bool? isDark = sharedPrefrences.getData(key: 'isDark');
  runApp(NewsApp(isDark));
}

class NewsApp extends StatelessWidget {
  final bool? isDark ;
  NewsApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..getBusinessData()..changeTheme(fromShared: isDark),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state){
        return MaterialApp(
            themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primarySwatch: Colors.blueGrey,
                scaffoldBackgroundColor: Colors.white,
                textTheme: TextTheme(
                    bodyText1: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black
                    )
                ),
                appBarTheme: AppBarTheme(
                    titleTextStyle: TextStyle(color: Colors.black, fontSize: 40),
                    iconTheme: IconThemeData(color: Colors.black),
                    color: Colors.white,
                    elevation: 0,
                    backwardsCompatibility: false,
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Colors.white,
                        statusBarIconBrightness: Brightness.dark)),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  elevation: 0,
                  backgroundColor: Colors.white,
                  unselectedIconTheme:
                      IconThemeData(color: Colors.blueGrey, size: 30),
                  selectedIconTheme: IconThemeData(color: Colors.black, size: 30),
                  unselectedItemColor: Colors.blueGrey,
                  selectedItemColor: Colors.black,
                ),
                backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.black)
            ),
            darkTheme: ThemeData(
              iconTheme: IconThemeData(color: Colors.white),
                scaffoldBackgroundColor: Color(0xFF282627),
                backgroundColor: Color(0xFF282627),
                appBarTheme: AppBarTheme(
                    backgroundColor: Color(0xFF282627),
                    elevation: 0,
                    titleTextStyle: TextStyle(fontSize: 40.0, color: Colors.white),
                    backwardsCompatibility: false,
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Color(0xFF282627),
                        statusBarIconBrightness: Brightness.light)),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  elevation: 0,
                  backgroundColor: Color(0xFF282627),
                  unselectedIconTheme: IconThemeData(color: Colors.white, size: 30),
                  selectedIconTheme:
                      IconThemeData(color: Colors.redAccent, size: 30),
                  unselectedItemColor: Colors.white,
                  selectedItemColor: Colors.redAccent,
                ),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white
                )
              )
            ),
            home: HomeScreen());
        }
      ),
    );
  }
  }

