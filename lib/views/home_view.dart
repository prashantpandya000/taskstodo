import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taskstodo/models/tasklist.dart';
import 'package:taskstodo/widgets/provider_widget.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:intl/intl.dart';
import 'testview.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
          stream: getUsersTripsStreamSnapshots(context),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text("Loading...");
            return new ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (BuildContext context, int index) =>
                    buildTripCard(context, snapshot.data.documents[index]));
          }),
    );
  }

  Stream<QuerySnapshot> getUsersTripsStreamSnapshots(
      BuildContext context) async* {
    final uid = await Provider.of(context).auth.getCurrentUID();
    yield* Firestore.instance
        .collection('users')
        .document(uid)
        .collection('Task')
        .snapshots();
  }

  Widget buildTripCard(BuildContext context, DocumentSnapshot document) {
    final tasklist = Tasklist.fromSnapshot(document);
    //final tasktype = tasklist.types();
    return new Container(
      child: Card(
        child: InkWell(
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                  child: Row(children: <Widget>[
                    Text(
                      tasklist.taskdata,
                      style: GoogleFonts.seymourOne(fontSize: 20.0),
                    ),
                    Spacer(),
                  ]),
                ),
              ])),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => testview(tasklist: tasklist)),
            );
            FloatingActionButton(onPressed: null);
          },
        ),
      ),
    );
  }
}

/*
class HomeView extends StatefulWidget {
  final Tasklist tasklist;

  const HomeView({Key key, this.tasklist}) : super(key: key);
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  get isSelected => isSelected;
  final db = Firestore.instance;
  //final Tasklist tasklist;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RaisedButton(
                  child: Text('khallas'),
                  onPressed: () async {
                    final uid = await Provider.of(context).auth.getCurrentUID();
                    await db
                        .collection("userdata")
                        .document(uid)
                        .collection('tasklist');
                  })
              /*   ToggleButtons(
              children: <Widget>[Icon(Icons.list), Icon(Icons.grid_on)],
              isSelected: [true, false],
              onPressed: (int index) {},
            ),*/
            ]),
      ),
    );
  }
}
*/
