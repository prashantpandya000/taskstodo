import 'package:flutter/material.dart';
import 'package:taskstodo/models/tasklist.dart';

// ignore: camel_case_types
class testview extends StatefulWidget {
  final Tasklist tasklist;

  const testview({Key key, this.tasklist}) : super(key: key);
  @override
  _testviewState createState() => _testviewState();
}

// ignore: camel_case_types
class _testviewState extends State<testview> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
