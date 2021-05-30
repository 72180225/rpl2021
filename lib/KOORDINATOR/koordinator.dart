import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rpl2021/KOORDINATOR/KP/listkpkoor.dart';
import 'package:rpl2021/KOORDINATOR/PRAKP/listprakpkoor.dart';
import 'package:rpl2021/KOORDINATOR/SK/listskkoor.dart';

import '../main.dart';

class Koordinator extends StatefulWidget {
  final String nama, email, foto;

  Koordinator({this.nama, this.email, this.foto});
  @override
  _KoordinatorState createState() => _KoordinatorState();
}

class _KoordinatorState extends State<Koordinator> {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  bool _isLoggedIn = false;

  _logout() async{
    await _googleSignIn.signOut();
    setState(() {
      _isLoggedIn = false;
    });
    Navigator.pushReplacement(context,
        MaterialPageRoute(
            builder: (context) => LoginPage()
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Koordinator"),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
                accountName: Text("${widget.nama}"),
                accountEmail: Text("${widget.email}"),
                currentAccountPicture:CircleAvatar(
                  backgroundImage: NetworkImage(widget.foto),
                )
            ),
            ListTile(
              leading: Icon(Icons.mail),
              title: Text('Pengajuan Sk'),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(
                        builder: (context) => ListSkKoor()
                    )
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.work),
              title: Text('Pengajuan Pra KP'),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(
                        builder: (context) => ListPraKpKoor()
                    )
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.work_outlined),
              title: Text('Pengajuan KP'),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(
                        builder: (context) => ListKpKoor()
                    )
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.timelapse),
              title: Text('Tanggal Ujian'),
              onTap: () {

              },
            ),
            SizedBox(
              height: 200,
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('LogOut'),
              onTap: () {
                _logout();
              },
            ),
          ],
        ),
      ),
    );
  }
}
