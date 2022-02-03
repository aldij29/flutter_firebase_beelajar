import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:beelajar_app/cubit/cubits.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './ui/pages/pages.dart';

void main() async {
  WidgetsFlutterBinding();
  await Firebase.initializeApp();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => TabCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/main-page': (context) => MainPage(),
        },
      ),
    );
  }
}
