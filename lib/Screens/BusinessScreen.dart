import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/Components.dart';
import 'package:news_application/Cubit/cubit.dart';
import 'package:news_application/Cubit/states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import '../Constants.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var dataList = AppCubit.get(context).businessdata;

          return NewsList(dataList) ;
        },
      );
  }
}

