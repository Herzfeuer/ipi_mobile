import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //variables
  static const double horizontalPadding = 25;
  static const double textFieldRadius = 15;

  //functions

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment(0, -0.7),
            colors: <Color>[
              Color(0xff00235c),
              Color(0x984d93ff),
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(horizontalPadding,210,horizontalPadding,100),
            child: Column(
              children: [

                Icon(
                    Icons.android_rounded,
                    color: Colors.white,
                    size: 200,
                ),

                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(textFieldRadius)),
                    ),
                    fillColor: Color(0xff144594),
                    filled: true,
                    labelText: 'Логин',
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontFamily: "Montserrat",
                      fontSize: 20,
                    ),
                  ),
                ),

                Padding(padding: EdgeInsets.all(5)),

                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(textFieldRadius)),
                    ),
                    fillColor: Color(0xff144594),
                    filled: true,
                    labelText: 'Пароль',
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontFamily: "Montserrat",
                        fontSize: 20,
                      ),
                  ),
                ),

                ElevatedButton(
                    onPressed: (){},
                    child: Text("Войти")
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


