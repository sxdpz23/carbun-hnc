import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:carbun/models/users.dart';
import 'package:carbun/screens/home/home.dart';
import 'package:carbun/services/authenticate.dart';
import 'package:firebase_core/firebase_core.dart';

void main() => _initialBootup();

_initialBootup() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

// for getting the app built in the release state ->
//      flutter build apk --target-platform android-arm,android-arm64,android-x64 --split-per-abi

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  // To set the application's orientation to Potrait only
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MultiProvider(
      providers: [
        StreamProvider<CurrentUser>.value(
          value: AuthenticationService().user,
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // theme: ThemeData(
        //   primarySwatch: Colors.blue,
        // ),
        home: Center(child: Home()),
      ),
    );
  }
}
