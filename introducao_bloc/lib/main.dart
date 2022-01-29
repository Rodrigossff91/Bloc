import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:introducao_bloc/pages/bloc/home_bloc.dart';
import 'package:introducao_bloc/pages/bloc/home_event.dart';
import 'package:introducao_bloc/pages/bloc/home_state.dart';
import 'package:introducao_bloc/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bloc',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<HomeBloc>(
          create: (context) {
            return HomeBloc(HomeLoadingState())..add(HomeFetchList());
          },
          child: HomePage()),
    );
  }
}
