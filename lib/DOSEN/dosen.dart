import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rpl2021/DOSEN/daftarbimbingan.dart';
import 'package:rpl2021/main.dart';

class Dosen extends StatefulWidget {
  final String nama, email, foto;

  Dosen({this.nama, this.email, this.foto});
  @override
  _DosenState createState() => _DosenState();
}

class _DosenState extends State<Dosen> {
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
        title: Text("Dosen"),
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
              title: Text('Daftar Bimbingan'),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(
                        builder: (context) => DaftarBimbingan()
                    )
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.work),
              title: Text('Melihat Jadwal Ujian'),
              onTap: () {

              },
            ),
            SizedBox(
              height: 330,
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
