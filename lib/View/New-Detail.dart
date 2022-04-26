import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NewsDetail extends StatefulWidget {
  const NewsDetail({Key? key}) : super(key: key);

  @override
  _NewsDetailState createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 70.h,
          width: 100.w,
          color: Colors.red,
        ),
      ),
    );
  }
}
