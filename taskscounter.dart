// ignore_for_file: must_be_immutable, camel_case_types, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

class taskcountar extends StatelessWidget {
  int alltodos;
  int allcompleted;

  taskcountar({required this.allcompleted, required this.alltodos});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Text('$allcompleted/$alltodos',
          style: TextStyle(
            fontSize: 44,
            fontWeight: FontWeight.bold,
            color: allcompleted == alltodos
                ? Color.fromARGB(255, 114, 175, 116)
                : Colors.white,
          )),
    );
  }
}
