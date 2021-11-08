import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/Components.dart';
import 'package:news_application/Cubit/cubit.dart';
import 'package:news_application/Cubit/states.dart';

class searchScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        var dataList = AppCubit.get(context).searchdata;
        TextEditingController controller = new TextEditingController();

        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  cursorColor: Colors.grey,
                  //controller: controller ,
                  cursorHeight: 30,
                  style: TextStyle(color: Colors.grey),
                  decoration: InputDecoration(
                      icon: Icon(Icons.search,color: Colors.grey,),
                      //hintText: "Search",
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)
                      ),

                  ),

                  onChanged: (value){AppCubit.get(context).Search(value);},

                ),
              ),
              Expanded(child: NewsList(dataList , isSearch: true))
            ],
          ),
        );
      },

    );
  }
}
