import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/login.dart';
import 'package:login_signup/register.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: (){
                 Navigator.of(context).push(new CupertinoPageRoute(builder: (BuildContext context){
                   return new MyLogin();
                 }));
              },
              child: Text("Login"),
            ),
            RaisedButton(
              onPressed: (){
                 Navigator.of(context).push(new CupertinoPageRoute(builder: (BuildContext context){
                   return new MyRegister();
                 }));
              },
              child: Text("Register"),
            )
          ],
        ),
      ),
    );
  }
}