// ignore_for_file: non_constant_identifier_names

import 'dart:ffi';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pull to refresh',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<String> demo_data;

  @override
  void initState() {
    demo_data = [
      "Flutter",
      "React",
      "Node Js",
      "C++",
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text("Pull To Refresh"),
            ),
            backgroundColor: Colors.black,
            body: RefreshIndicator(
              child: ListView.builder(
                itemBuilder: ((context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(demo_data[index]),
                    ),
                  );
                }),
                itemCount: demo_data.length,
                physics: const AlwaysScrollableScrollPhysics(),
              ),
              onRefresh: () {
                return Future.delayed(const Duration(seconds: 1), (() {
                  setState(() {
                    demo_data.addAll(["Html", "CSS", "Python"]);
                  });
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Page Refresh')));
                }));
              },
            )));
  }
}
