import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Addv extends StatelessWidget {
  Addv({super.key});
  final TextEditingController fname=TextEditingController();
  final TextEditingController lname=TextEditingController();
  final TextEditingController purpose=TextEditingController();
  final TextEditingController towhom=TextEditingController();

  Future<void> sendData() async {
    final url = Uri.parse(
        "https://log-app-demo-api.onrender.com/addvisitor");
    try {
      await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "firstname": fname.text,
          "lastname": lname.text,
          "college": purpose.text,
          "dob": towhom.text
        }),
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
        // Background Image
        Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
        gradient: LinearGradient(
        colors: [Color(0xff63E5C5), Color(0xff14366F)],
    ),
    ),
    ),
    Container(
    child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 130),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
    Text(
    'DIGILOG',
    textAlign: TextAlign.center,
    style: TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    ),
    ),
    Text(
    'Add New Visitor',
    textAlign: TextAlign.center,
    style: TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    ),
    ),
    ],
    ),
    ),
    ),
    Padding(
    padding: const EdgeInsets.only(left: 0, top: 300, right: 0),
    child: Container(
    decoration: BoxDecoration(
    borderRadius: BorderRadius.only(
    topLeft: Radius.circular(40),
    topRight: Radius.circular(40),
    ),
    color: Colors.white38,
    ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: Column(
            children: [
              TextField(controller: fname,
                decoration: InputDecoration(
                    labelText: "Firstname",
                    hintText: "Enter the first name",hintStyle: TextStyle(color: Colors.black87),
                    labelStyle:TextStyle(color: Colors.black87),
                    prefixIcon:Icon(Icons.person_add_alt) ,
                    prefixIconColor: Colors.black54,
                    border: UnderlineInputBorder()
                ),
              ),
              SizedBox(height: 20,),
              TextField(controller: lname,
                decoration: InputDecoration(
                    labelText: "Lastname",
                    hintText: "Enter the last name",hintStyle: TextStyle(color: Colors.black87),
                    labelStyle:TextStyle(color: Colors.black87),
                    prefixIcon:Icon(Icons.person_add_alt) ,
                    prefixIconColor: Colors.black54,
                    border: UnderlineInputBorder()
                ),
              ),
              SizedBox(height: 20,),
              TextField(controller: purpose,
                decoration: InputDecoration(
                    labelText: "Purpose of visit",
                    hintText: "Enter the purpose of visit",hintStyle: TextStyle(color: Colors.black87),
                    labelStyle:TextStyle(color: Colors.black87),
                    prefixIcon:Icon(Icons.file_copy) ,
                    prefixIconColor: Colors.black54,
                    border: UnderlineInputBorder()
                ),
              ),
              SizedBox(height: 20,),
              TextField(controller: towhom,
                decoration: InputDecoration(
                    labelText: "Whom to meet",
                    hintText: "Enter the name",hintStyle: TextStyle(color: Colors.black87),
                    labelStyle:TextStyle(color: Colors.black87),
                    prefixIcon:Icon(Icons.person_outline) ,
                    prefixIconColor: Colors.black54,
                    border: UnderlineInputBorder()
                ),
              ),
              SizedBox(height: 20,),
              SizedBox(
                width: 150,height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff3D4D55),
                    foregroundColor: Colors.black54,
                  ),
                  onPressed: () async {
                    await sendData();
                  },
                  child: Text("Submit", style: TextStyle(
                    color: Colors.white, fontSize: 20.0,),

                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  print("Set");
                },
                child: Text("click here"),
              ),

            ],
          ),
        ),
      ),


    ),),],),);
    return const Placeholder();
  }
}



