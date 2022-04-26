import 'package:api_demo/Post/Model/req/Signup_req.dart';
import 'package:api_demo/Post/api_services/api_service_up.dart';
import 'package:api_demo/View/Homepage.dart';
import 'package:flutter/material.dart';

class SignUp_Page extends StatefulWidget {
  const SignUp_Page({Key? key}) : super(key: key);

  @override
  _SignUp_PageState createState() => _SignUp_PageState();
}

class _SignUp_PageState extends State<SignUp_Page> {
  final _firstname = TextEditingController();
  final _lastname = TextEditingController();
  final _username = TextEditingController();
  final _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 150,
                width: 150,
                color: Colors.red,
              ),
              SizedBox(
                height: 25,
              ),
              TextField(
                controller: _firstname,
                decoration: InputDecoration(hintText: 'FirstName'),
              ),
              SizedBox(
                height: 12,
              ),
              TextField(
                controller: _lastname,
                decoration: InputDecoration(hintText: 'LastName'),
              ),
              SizedBox(
                height: 12,
              ),
              TextField(
                controller: _username,
                decoration: InputDecoration(hintText: 'UserName'),
              ),
              SizedBox(
                height: 12,
              ),
              TextField(
                controller: _password,
                decoration: InputDecoration(hintText: 'Password'),
              ),
              SizedBox(
                height: 12,
              ),
              ElevatedButton(
                onPressed: () {
                  SignUpModel info = SignUpModel();

                  info.firstName = _firstname.text;
                  info.lastName = _lastname.text;
                  info.username = _username.text;
                  info.password = _password.text;
                  info.avatar =
                      "https://loveshayariimages.in/wp-content/uploads/2021/10/1080p-Latest-Whatsapp-Profile-Images-1.jpg";

                  SignService.singUp(reqModel: info.toJson()).then(
                    (value) => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyHomePage(),
                      ),
                    ),
                  );
                },
                child: Text(
                  'SignUp',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
