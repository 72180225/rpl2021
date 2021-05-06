import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rpl2021/PRAKP/listprakp.dart';
import 'package:rpl2021/main.dart';

import 'adddatakp.dart';
import 'detailkp.dart';

class ListKp extends StatefulWidget {
  @override
  _ListKpState createState() => _ListKpState();
}



class _ListKpState extends State<ListKp> {
  Future<List> getDataKp() async{
    final response = await http.get("http://10.0.2.2/rpljaya_2021/getdatakp.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Kp"),
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        onPressed: ()=>Navigator.of(context).push(
          new MaterialPageRoute(
            builder:(BuildContext context)=> new AddDataKp(),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text("Surat Keterangan KP"),
              trailing: Icon(Icons.arrow_forward),

            ),
            ListTile(
              title: Text("Pengajuan Pra KP"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ListPraKp()),
                );
              },
            ),
            ListTile(
              title: Text("Pengajuan KP"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ListKp()),
                );
              },
            ),
            ListTile(
              title: Text("Pengajuan Tanggal Ujian"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Text("Home"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: new FutureBuilder<List>(
        future: getDataKp() ,
        builder: (context, snapshot){
          if(snapshot.hasError) print(snapshot.error);
          return snapshot.hasData ? new ItemList(list: snapshot.data,) : new Center(child: new CircularProgressIndicator(),);
        },
      ),//this will just add the Navigation Drawer Icon
    );
  }
}

class ItemList extends StatelessWidget {
  List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list==null ? 0 : list.length,
      itemBuilder: (context, i ) {
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: ()=>Navigator.of(context).push(
                new MaterialPageRoute(
                    builder: (BuildContext context) => new DetailKp(list: list,index: i,)
                )
            ),
            child: new Card(
              child: new ListTile(
                title: new Text(list[i]['nim']),
                leading: new Icon(Icons.person),
                subtitle: new Text("Judul : ${list[i]['judul_kp']}"),
              ),
            ),
          ),
        );
      },
    );
  }
}
