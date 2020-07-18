import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'models/user.dart';
import 'services/auth_service.dart';
import 'services/usermanagement.dart';

class Schedule extends StatefulWidget {
  final String uid;

  const Schedule({Key key, this.uid}) : super(key: key);

  @override
  _ScheduleState createState() => _ScheduleState(uid);
}

class _ScheduleState extends State<Schedule> {
  UserManagement _userManagement = UserManagement();
  String uid;
  _ScheduleState(this.uid) {
    uid = this.uid;
  }
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: StreamBuilder(
            stream: Firestore.instance
                .collection('users')
                .document(uid)
                .snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              if ((snapshot.connectionState == ConnectionState.waiting) &&
                  snapshot.hasError)
                return new Center(child: new CircularProgressIndicator());
              if (snapshot.hasData && (snapshot.data.documentID.isNotEmpty)) {
                Text(snapshot.data.documentID);
              }
            }));
  }
}

Center userPage(DocumentSnapshot snapshot) {
  return Center(child: Text(snapshot.data['name']));
}
