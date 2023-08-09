// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

class Todocard extends StatelessWidget {
  String vartitle;
  bool boolstatus;
  Function changestatus;
  int index;
  Function delete;
  Todocard(
      {required this.vartitle,
      required this.delete,
      required this.index,
      required this.changestatus,
      required this.boolstatus});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changestatus(index);
      },
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Container(
          padding: EdgeInsetsDirectional.all(20),
          decoration: BoxDecoration(
              color: Color.fromRGBO(209, 224, 224, 0.2),
              borderRadius: BorderRadius.circular(14)),
          margin: EdgeInsets.only(top: 33),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                vartitle,
                style: TextStyle(
                    fontSize: 20,
                    color: boolstatus ? Colors.black : Colors.white,decoration: boolstatus?TextDecoration.lineThrough:TextDecoration.none),
              ),
              Row(
                children: [
                  Icon(
                    size: 25,
                    color: boolstatus ? Colors.green : Colors.red,
                    boolstatus ? Icons.check : Icons.close,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  IconButton(
                    onPressed: () {
                      delete(index);
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Color.fromARGB(255, 225, 131, 125),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
