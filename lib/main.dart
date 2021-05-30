import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rpl2021/KOORDINATOR/koordinator.dart';
import 'package:rpl2021/dashboard.dart';
import 'package:rpl2021/pengajuanSK/sk.dart';

import 'DOSEN/dosen.dart';
import 'KP/kp.dart';
import 'MAHASISWA/mahasiswa.dart';
import 'PRAKP/prakp.dart';
import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      home: LoginPage(),
    );
  }
}
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoggedIn = false;


  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  _login() async{
    final googleUser = await GoogleSignIn().signIn();
    if(googleUser != null && googleUser.email.contains("si.ukdw.ac.id")){
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => Mahasiswa(nama: googleUser.displayName, email: googleUser.email, foto: googleUser.photoUrl,)));
    } else if(googleUser != null && googleUser.email.contains("gmail.com")){
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => Dosen(nama: googleUser.displayName, email: googleUser.email, foto: googleUser.photoUrl,)));
    } else if(googleUser != null && googleUser.email.contains("students.ukdw.ac.id")){
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => Koordinator(nama: googleUser.displayName, email: googleUser.email, foto: googleUser.photoUrl,)));
    }

  }

  _logout() async{
    _googleSignIn.signOut();
    setState(() {
      _isLoggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.network('')),
              ),
            ),
            // Padding(
            //   //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
            //   padding: EdgeInsets.symmetric(horizontal: 15),
            //   child: TextField(
            //     decoration: InputDecoration(
            //         border: OutlineInputBorder(),
            //         labelText: 'Email',
            //         hintText: 'Enter valid email id as abc@gmail.com'),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(
            //       left: 15.0, right: 15.0, top: 15, bottom: 0),
            //   //padding: EdgeInsets.symmetric(horizontal: 15),
            //   child: TextField(
            //
            //     obscureText: true,
            //     decoration: InputDecoration(
            //         border: OutlineInputBorder(),
            //         labelText: 'Password',
            //         hintText: 'Enter secure password'),
            //   ),
            // ),
            // FlatButton(
            //   onPressed: (){
            //     //TODO FORGOT PASSWORD SCREEN GOES HERE
            //   },
            //   child: Text(
            //     'Forgot Password',
            //     style: TextStyle(color: Colors.blue, fontSize: 15),
            //   ),
            // ),
            // Container(
            //   height: 50,
            //   width: 250,
            //   decoration: BoxDecoration(
            //       color: Colors.blue, borderRadius: BorderRadius.circular(20)),
            //   child: FlatButton(
            //     onPressed: () {
            //       _login();
            //     },
            //     child: Text(
            //       'Login',
            //       style: TextStyle(color: Colors.white, fontSize: 25),
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // Text('Or'),
            SizedBox(
              height: 100,
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () {
                  _login();
                },
                child: Text(
                  'GOOGLE',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            // Text('New User? Create Account')
          ],
        ),
      ),
      ),
    );
  }
}



