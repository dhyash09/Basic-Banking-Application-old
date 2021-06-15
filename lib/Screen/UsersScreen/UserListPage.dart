import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserList extends StatefulWidget {
  const UserList({Key key}) : super(key: key);

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  CollectionReference reference =
      FirebaseFirestore.instance.collection('users');

  String url =
      "https://firebasestorage.googleapis.com/v0/b/new-yash-project.appspot.com/o/users.svg?alt=media&token=87d3c70e-3611-4a51-95a2-fe04de26cfd1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeabf9f),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Customers",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: StreamBuilder(
            stream: reference.snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              }
              return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Card(
                      elevation: 2,
                      color: Color(0xfffaf3e0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      margin: EdgeInsets.fromLTRB(20, 8, 20, 0),
                      child: ListTile(
                        leading: CircleAvatar(
                          child: SvgPicture.network(url, color: Color(0xfffaf3e0), width: 24, height: 24,),
                          backgroundColor: Color(0xff1e212d),
                        ),
                        isThreeLine: true,
                        title: Padding(
                          padding:
                              const EdgeInsets.only(top: 8, left: 8, right: 8),
                          child: Text(
                            snapshot.data.docs[index]['name'],
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(
                              top: 4, bottom: 8, left: 8, right: 8),
                          child: Text(
                            'Balance: ${snapshot.data.docs[index]['balance']}/-Rs \nEmail: ${snapshot.data.docs[index]['email']}',
                            style: TextStyle(color: Color(0xffb68973)),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
      ),
    );
  }
}
