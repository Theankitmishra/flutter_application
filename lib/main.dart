import 'package:flutter/material.dart';
import 'package:flutter_application/cubit/app_cubit_logics.dart';
import 'package:flutter_application/cubit/app_cubits.dart';
import 'package:flutter_application/pages/detail_page.dart';
import 'package:flutter_application/pages/home_page.dart';
import 'package:flutter_application/pages/navpages/main_page.dart';
import 'package:flutter_application/pages/welcome_page.dart';
import 'package:flutter_application/services/data_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'flutter demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: BlocProvider<AppCubits>(
          create: (context) => AppCubits(
            data: DataServices(),
          ),
          child: AppCubitLogics(),
        ));
  }
}
