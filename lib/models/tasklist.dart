import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'user.dart';

class Tasklist {
  String taskdata;
  String tasktype;
  String documentId;
  Tasklist(
    this.taskdata,
    this.tasktype,
  );
  Map<String, dynamic> toJson() => {
        'taskdata': taskdata,
        'tasktype': tasktype,
      };

  Tasklist.fromSnapshot(DocumentSnapshot snapshot)
      : taskdata = snapshot['taskdata'],
        tasktype = snapshot['tasktype'],
        documentId = snapshot.documentID;

  Map<String, Color> types() => {
        'red': Colors.red[500],
        'orange': Colors.orange[500],
        'green': Colors.green[500],
      };

  //DocumentReference reference;
  //final databaseReference = Firestore.instance;
  //Tasklist(this.tasklist, {this.tasklist, this.reference});

  // factory Tasklist.fromjason(Map<dynamic, dynamic> json) =>
  // _TasklistFromJson(json);

  // Map<String, dynamic> tojason() => _TasklistTojson(this);
  //       @override
  //     String toString() => "Tasklist<$tasklist>";

  // ignore: empty_constructor_bodies

  // }

  //  class _TasklistTojson {
//}

  //     class _TasklistFromJson {}
// working link for todo
//https://www.youtube.com/watch?v=ZGrmizhBF_s
//addsame color into it for differentiating based on task
}
