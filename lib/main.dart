import 'package:bloc_bourboncode_hardcode/empleado.dart';
import 'package:bloc_bourboncode_hardcode/homePage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi app Empleado',
      theme: ThemeData(

        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
       routes: {
       "/": (context) => InitialPage(),
        "/home": (context) => HomePage(),
      
      },
    );
  }
}

class InitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Initial Page")),
      body: Center(
        child: RaisedButton(
          child: Text("Goto HomePage"),
          onPressed: () {
            Navigator.pushNamed(
                context,
                "/home"
            );
          },
        ),
      ),
    );
  }
}

