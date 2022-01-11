import 'package:flutter/material.dart';

import 'package:sayanclub/screens/authscreen/loginScreen.dart';
import 'package:sayanclub/screens/createworkoutandexercisescreen/createNewExerciseScreen.dart';
import 'package:sayanclub/screens/createworkoutandexercisescreen/createWorkOutScreen.dart';

 main()  {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:LoginScreen(),

    );
  }
}


