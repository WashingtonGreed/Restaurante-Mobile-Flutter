import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:restaurantemobileflutter/utils/const.dart';
import 'package:path_provider/path_provider.dart';
import 'package:restaurantemobileflutter/src/navigationBar/BottomNavBar.dart';
import '01.login/login-bloc.dart';

var token = '';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HomePage',
      theme: isDark ? Constants.darkTheme : Constants.lightTheme,
      home: FutureBuilder(
        future: _vespeiro(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.error == null) {
              return LoginPage();
            } else {
              return BottomNavBar();
            }
          } else {
            return Scaffold(
              body: Center(
                  child: SizedBox(
                width: 200,
                height: 200,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.red,
                ),
              )),
            );
          }
        },
      ),
    );
  }
}

Future _vespeiro() async {
  var dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  var box = await Hive.openBox('TOKEN');
  token = box.get('TOKEN');
}
