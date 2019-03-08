import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class MyRegister extends StatefulWidget {
  @override
  _MyRegisterState createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  TextEditingController _controllerName = new TextEditingController();
  TextEditingController _controllerEmail = new TextEditingController();
  TextEditingController _controllerPassword = new TextEditingController();
 var url = "http://192.168.***.***/myAppFolder/register.php";
void addData() async{
 var response = await http.post(url,
body: {
    "Email": _controllerEmail.text.trim(),
    "Name": _controllerName.text.trim(),
    "Password": _controllerPassword.text.trim(),
  }
  ); 
  var jsonData = jsonDecode(response.body);
  var jsonString = jsonData['message'];
  // obtain shared preferences

   if(jsonString=='success'){
     myToast(jsonString);
     //You can route to your desire page here
  }else{
    myToast(jsonString);
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: SingleChildScrollView(
              child: Container(
          padding: const EdgeInsets.all(6.0),
          color: Colors.grey.withAlpha(20),
                child: Column(
            children: <Widget>[
               //card for Fullname TextField
                   Card(
                     elevation: 6.0,
               child: TextField(
                 controller: _controllerName,
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
                labelText: "Fullname"
              ),
              obscureText:false,
              ),
                   ),
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
                labelText: "Email"
              ),
              obscureText:false,
              ),
                   ),
               //card for Password TextField
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
                  child: Icon(Icons.person, color: Colors.black),
                ),
                contentPadding: EdgeInsets.all(18),
                labelText: "Password"
              ),
              obscureText:true,
              ),
                   ), 

               //Signup Button

               RaisedButton(
                 onPressed: (){
                   addData();
                 },
                 child: Text("Register"),
               )             
            ],
          ),
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