import 'package:api_demo/Post/Model/req/signin_req.dart';
import 'package:api_demo/Post/api_services/api_service_In.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
                onPressed: () async {
                  SignInModel info = SignInModel();

                  info.username = _username.text;
                  info.password = _password.text;

                  bool status = await SigninService.singin(info.toJson());

                  if (status == true) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Successful'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Invalid User Name or Password'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                },
                child: Text(
                  'SignIn',
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
