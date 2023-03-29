import 'package:api_interview_app/log_in_screen.dart';
import 'package:api_interview_app/sign_up_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 350,top: 250),
              child: ElevatedButton(
                  style: ButtonStyle(fixedSize: MaterialStateProperty.all(Size(300, 50))),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LogInScreen(),));
              }, child: Text("Log In")),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 350),
              child: ElevatedButton(
                  style: ButtonStyle(fixedSize: MaterialStateProperty.all(Size(300, 50))),
                  onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));
              }, child: Text("Sign in")),
            ),
          ],
        ),
      ),
    );
  }
}
