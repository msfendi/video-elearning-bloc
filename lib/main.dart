import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_elearning/data/bloc/post_bloc.dart';
import 'package:video_elearning/data/repositories/api_repository.dart';
import 'package:video_elearning/data/repositories/data_repository.dart';
import 'package:video_elearning/presentation/screen/home_screen.dart';

void main() {
  runApp(MyApp(dataService: DataService()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.dataService}) : super(key: key);
  final DataService dataService;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Flutter Bloc API',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocProvider(
          create: (context) => PostBloc(apiRepository: ApiRepository(dataService: dataService))..add(LoadEvent()),
          child: const HomeScreen(),
        )
    );
  }
}
