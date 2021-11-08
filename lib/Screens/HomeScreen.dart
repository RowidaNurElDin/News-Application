import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/Cubit/cubit.dart';
import 'package:news_application/Cubit/states.dart';
import 'searchScreen.dart';

import '../Components.dart';
class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit,AppStates>(
        listener: (context, state){},
        builder: (context,state){
          var cubit = AppCubit.get(context);

          return Scaffold(
            drawer: SideDrawer(context),
            appBar: AppBar(
              title: Text("Discover"),
              actions: [
                IconButton(
                    onPressed: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>searchScreen()));
                    },
                    icon: Icon(Icons.search))
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.items,
              currentIndex: cubit.currentindex,
              onTap: (index){
                cubit.changeIndex(index);
                },
            ),
            body: cubit.newsappScreens[cubit.currentindex],
          );
        },
      ) ;
  }
}

