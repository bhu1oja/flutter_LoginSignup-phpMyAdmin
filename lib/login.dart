import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class MyLogin extends StatefulWidget {
  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {

TextEditingController _controllerPassword = new TextEditingController();
  TextEditingController _controllerEmail = new TextEditingController();
  var url = "http://192.168.***.***/myAppFolder/login.php";

void addData() async{
 var response = await http.post(url,
body: {
    "Email": _controllerEmail.text.trim(),
    "Password": _controllerPassword.text.trim(),
   
  }
  ); 
  var jsonData = jsonDecode(response.body);
  var jsonString = jsonData['message'];
  if(jsonString=='success'){
    myToast(jsonString);
  }else{
    myToast(jsonString);
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        color: Colors.grey.withAlpha(20),
          child: Column(
            children: <Widget>[
              //card for Email TextField
               Card(
                 elevation: 6.0,
          child: TextField(
            controller: _controllerEmail,
          style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                 ),
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: EdgeInsets.only(left:20,right:15),
              child: Icon(Icons.person, color: Colors.black),
            ),
            contentPadding: EdgeInsets.all(18),
            labelText: "Username"
          ),
          obscureText:false,
          ),
               ),
// Card for password TextField
           Card(
             elevation: 6.0,
          child: TextField(
            controller: _controllerPassword,
          style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                 ),
          decoration: InputDecoration(
              prefixIcon: Padding(
                padding: EdgeInsets.only(left:20,right:15),
                child: Icon(Icons.message, color: Colors.black),
              ),
              contentPadding: EdgeInsets.all(18),
              labelText: "Password"
          ),
          obscureText:true,
          ),
           ),
         RaisedButton(
           child: Text("Login"),
           onPressed: (){
             addData();
           },
         )
            ],
          ),
      ),
    );
  }
}


myToast(String toast){
return Fluttertoast.showToast(
        msg: toast,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white
    );
}