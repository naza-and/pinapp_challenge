import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinnap_challenge/pages/home/home.dart';

import 'bloc/main_bloc.dart';

void main() {
  runApp(const AppState());
}

final postBloc = MainBloc();

class AppState extends StatelessWidget {

  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_)=>MainBloc(),
        child: const MyApp()
    );
  }
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme
        ),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

