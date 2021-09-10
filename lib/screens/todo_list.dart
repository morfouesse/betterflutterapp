import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {

  final textColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    //base de l'appl /////////BODY///////////i scaffold
    return Container(
      child: Text('lorem',
          style: TextStyle(color: textColor)
      ),
    );
  }
}