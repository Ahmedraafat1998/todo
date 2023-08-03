// ignore_for_file: no_logic_in_create_state, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, sort_child_properties_last, sized_box_for_whitespace, camel_case_types

import 'package:flutter/material.dart';

import 'widget/taskscounter.dart';
import 'widget/widgt.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: todo(),
    );
  }
}

class todo extends StatefulWidget {
  const todo({super.key});

  @override
  State<todo> createState() => _MyWidgetState();
}

class Task {
  String title;
  bool status;
  Task({required this.title, required this.status});
}

class _MyWidgetState extends State<todo> {
  List alltask = [
    Task(title: "bubleshvideo", status: true),
    Task(title: "laught ", status: false),
    Task(title: "Gym", status: false),
    Task(title: "call me", status: false),
  ];

  changestatus(int taskindex) {
    setState(() {
      alltask[taskindex].status = !alltask[taskindex].status;
    });
  }

  final myControllar = TextEditingController();
  myfun() {
    setState(() {
      alltask.add(
        Task(title: myControllar.text, status: false),
      );
    });
  }

  numberofcompletetask() {
    int compeletedtask = 0;
    alltask.forEach((item) {
      if (item.status) {
        compeletedtask++;
      }
    });

    return compeletedtask;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(58, 66, 86, 0.7),
        title: Text(
          "To Do App",
          style: TextStyle(fontSize: 30),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 45, 50, 64),
      body: SizedBox(
        width: double.infinity,
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              taskcountar(
                alltodos: alltask.length,
                allcompleted: numberofcompletetask(),
              ),
              Container(
                margin: EdgeInsets.only(top: 22),
                color: Color.fromARGB(255, 59, 65, 78),
                height: 500,
                child: ListView.builder(
                  itemCount: alltask.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Todocard(
                        index: index,
                        changestatus: changestatus,
                        vartitle: alltask[index].title,
                        boolstatus: alltask[index].status);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Container(
                  padding: EdgeInsets.all(20),
                  color: Color.fromARGB(255, 221, 228, 173),
                  height: 220,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: myControllar,
                        maxLength: 30,
                        decoration: InputDecoration(
                          hintText: "Add New Task",
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      TextButton(
                          onPressed: () {
                            myfun();
                            Navigator.pop(context);
                          },
                          child: Text(
                            'ADD',
                            style: TextStyle(fontSize: 20),
                          ))
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.redAccent,
      ),
    );
  }
}
