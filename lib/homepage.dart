// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last

import 'package:aster/post.dart';
import 'package:aster/service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post>? posts;
  var isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    posts = await Service.getData();
    if (posts != null) {
      setState(() {
        isLoading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: false,
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text(
              "Aster",
              style: TextStyle(fontSize: 28, color: Colors.blue),
            )),
        body: SafeArea(
          bottom: false,
          child: Visibility(
            visible: isLoading,
            child: ListView.builder(
                itemCount: posts?.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(posts![index].userId.toString()),
                            Text(posts![index].id.toString()),
                            Text(posts![index].title.toString()),
                            Text(posts![index].body.toString()),
                          ]),
                    ),
                  );
                }),
            replacement: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ));
  }
}
//Text(posts![index].title.toString())