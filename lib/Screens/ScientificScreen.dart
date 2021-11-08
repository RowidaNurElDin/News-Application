import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/Cubit/cubit.dart';
import 'package:news_application/Cubit/states.dart';

import '../Components.dart';
import '../Constants.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var dataList = AppCubit.get(context).sciencedata;

        return NewsList(dataList) ;
      },
    );
  }
}
