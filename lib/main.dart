import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moruapp/Bloc/Weather_bloc.dart';
import 'package:moruapp/Pages/Help_Page.dart';
import 'package:moruapp/Pages/Splash_Screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Services/WeatherRepo.dart';

void main(List<String> args) {
  runApp(SplashPage(
    key: UniqueKey(),
    onInitializationComplete: () => runApp(ProviderScope(child: MyApp())),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moru App',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext _context) => Homepage(),
      },
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey[900],
        body: BlocProvider(create: ((context) => WeatherBloc(WeatherRepo()))),
      ),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
