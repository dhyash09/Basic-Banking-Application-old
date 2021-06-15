import 'package:balance/HomePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent,
    statusBarColor: Colors.transparent,
  ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Regular"),
      home: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error initializing Firebase');
          } else if (snapshot.connectionState == ConnectionState.done) {
            return HomePage();
          } else {
            return CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Colors.black,
              ),
            );
          }
        },
      ),
      routes: {
        HomePage.id: (context) => HomePage(),
      }
      // home: AddRemoveMoney(),
    );
  }
}
