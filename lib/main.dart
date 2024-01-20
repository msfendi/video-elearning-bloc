import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_elearning/data/bloc/post_bloc.dart';
import 'package:video_elearning/data/bloc/register/register_bloc.dart';
import 'package:video_elearning/data/repositories/api_repository.dart';
import 'package:video_elearning/data/repositories/auth_repository.dart';
import 'package:video_elearning/data/repositories/data_repository.dart';
import 'package:video_elearning/presentation/screen/home_screen.dart';
import 'package:video_elearning/presentation/screen/register_screen.dart';

void main() {
  runApp(MyApp(dataService: DataService(), authService: AuthService(),));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.dataService, required this.authService}) : super(key: key);
  final DataService dataService;
  final AuthService authService;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Flutter Bloc API',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //----------------- 4. Membungkus HomeScreen dengan BlocProvider -----------------
        // homescreen dibungkus blocprovider saat pertama kali dirender, dan langsung memanggil api
        // >>>>>>>>>>>>> lanjut ke home_screen dengan membawa context untuk digunakan turunan-turunannya >>>>>>>>>>>>>
        home: BlocProvider(
          create: (context) => RegisterBloc(authService: authService),
          // PostBloc(apiRepository: ApiRepository(dataService: dataService))..add(LoadEvent()),
          child: const RegisterScreen(),
        )
    );
  }
}
