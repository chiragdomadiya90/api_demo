import 'package:api_demo/responsive.dart';
import 'package:flutter/material.dart';

class Res extends StatelessWidget {
  const Res({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (Responsive.isDesktop(context))
            Center(
              child: Text(
                'Desktop',
                style: TextStyle(fontSize: 70, color: Colors.blue),
              ),
            ),
          if (Responsive.isTablet(context))
            Center(
              child: Text(
                'Tablet',
                style: TextStyle(fontSize: 45, color: Colors.green),
              ),
            ),
          if (Responsive.isMobile(context))
            Center(
              child: Text(
                'Mobile',
                style: TextStyle(fontSize: 25, color: Colors.red),
              ),
            ),
        ],
      ),
    );
  }
}
