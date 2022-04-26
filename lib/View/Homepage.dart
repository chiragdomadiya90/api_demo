import 'dart:convert';

import 'package:api_demo/Model/req_directory/news_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sizer/sizer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<News> getData() async {
    http.Response response = await http.get(Uri.parse(
        'https://newsapi.org/v2/everything?q=tesla&from=2022-02-22&sortBy=publishedAt&apiKey=d29f7b5841f3472ebb73bcfb14e357ed'));

    var result = jsonDecode(response.body);
    print("Response====>>>${jsonDecode(response.body)}");
    return newsFromJson(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text('News Update'),
        actions: [Icon(Icons.search)],
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, AsyncSnapshot<News> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: snapshot.data!.articles!.length,
              itemBuilder: (context, index) {
                final newsinfo = snapshot.data!.articles![index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 150.sp,
                      width: 100.w,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage('${newsinfo.urlToImage}'),
                            fit: BoxFit.fill),
                      ),
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    Text('${newsinfo.title}'),
                    SizedBox(
                      height: 10.sp,
                    ),
                    Row(
                      children: [
                        Text(
                            '${newsinfo.publishedAt.toString().split(':')[0]} :'),
                        Text(
                            '${newsinfo.publishedAt.toString().split(':')[1]}'),
                      ],
                    ),
                    Divider(
                      thickness: 2,
                    ),
                  ],
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
