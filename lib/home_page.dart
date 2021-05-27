import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  String _doc;
  String _description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home News"),
        ),
        body: Column(
          children: [
            myForm(),
            myList(),
          ],
        ));
  }

  Widget myForm() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(40, 30, 40, 0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Title",
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.deepPurple,
                  ),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _doc = value.trim();
                });
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(40, 0, 40, 40),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Description",
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.deepPurple,
                  ),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _description = value.trim();
                });
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
            child: ElevatedButton(
              child: Text("Send data"),
              onPressed: () async {
                if (_doc == '' || _description == '') return;

                FirebaseFirestore.instance
                    .collection("collection")
                    .doc()
                    .set({"title": _doc, "description": _description});
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Widget myList() {
    return Expanded(
      child: StreamBuilder<QuerySnapshot>(
          stream:
              FirebaseFirestore.instance.collection("collection").snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) return new Text("No documents");
            return new ListView(children: getListItems(snapshot));
          }),
    );
  }

  getListItems(AsyncSnapshot<QuerySnapshot> snapshot) {
    return snapshot.data.docs
        .map((doc) => new ListTile(
            title: new Text(
              doc["title"],
            ),
            subtitle: new Text(
              doc["description"],
            )))
        .toList();
  }
}
