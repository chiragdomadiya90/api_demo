import 'package:api_demo/Post/Model/req/signin_req.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'Post/view/signIn_screen.dart';
import 'Post/view/sign_up_screen.dart';
import 'View/Extra.dart';
import 'View/Homepage.dart';
import 'View/New-Detail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
          debugShowCheckedModeBanner: false, theme: ThemeData(), home: Res());
    });
  }
}
