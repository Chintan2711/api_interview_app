import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController emailController =TextEditingController();
  TextEditingController passwordController =TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("login screen"),
      ),
      backgroundColor: Colors.grey,
      body: Column(
         mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              hintText: "Enter Email",
              labelText: "Email",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.black87),
              ),
            ),
          ),
          const SizedBox(height: 15),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(
              hintText: "Enter Password",
              labelText: "Password",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.black87),
              ),
            ),
          ),
          SizedBox(height: 30,),
          ElevatedButton(
              style: ButtonStyle(fixedSize: MaterialStateProperty.all(Size(250, 30))),
              onPressed: () {
              postApi(emailController.text.toString(),passwordController.text.toString());
          }, child: Text("Register")),
        ],

      ),
    );

  }
  postApi(String email,password)
  async {
    var client = http.Client();
    try {
      Response response = await client.post(
          Uri.parse('https://reqres.in/api/login'),
          body: {
            'email': email,
            'password': password,
          }
          );
      if(response.statusCode==200)
        {
          var data= jsonDecode(response.body.toString());
          print(data['token']);

          print(" login Successfully");
        }
      else{
        print("failed");
      }
    }finally {
      client.close();
    }

  }


}


