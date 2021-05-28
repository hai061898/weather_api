import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/bloc/WeatherBloc.dart';
import 'package:weather/screens/home_screen.dart';
import 'package:weather/service/WeatherApi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(  
        primarySwatch: Colors.blue,

      ),
       home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey,
        body: BlocProvider(
          create: (context) => WeatherBloc(WeatherResponse()),
          child: HomeScreen(),
        ),
      )
    );
  }
}