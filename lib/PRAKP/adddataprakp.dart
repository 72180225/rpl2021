import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddDataPraKp extends StatefulWidget {
  @override
  _AddDataPraKpState createState() => _AddDataPraKpState();
}

class _AddDataPraKpState extends State<AddDataPraKp> {

  TextEditingController controlleridprakp = new TextEditingController();
  TextEditingController controllersemester = new TextEditingController();
  TextEditingController controllertahun = new TextEditingController();
  TextEditingController controllernim = new TextEditingController();
  TextEditingController controllerjudulprakp = new TextEditingController();
  TextEditingController controllertools = new TextEditingController();
  TextEditingController controllerlembaga = new TextEditingController();
  TextEditingController controllerpimpinan = new TextEditingController();
  TextEditingController controlleralamat = new TextEditingController();
  TextEditingController controllerfax = new TextEditingController();
  TextEditingController controllerskprakp = new TextEditingController();


  void addDataPraKp(){
    var url="http://10.0.2.2/rpljaya_2021/adddataprakp.php";

    http.post(url, body: {
      "id_prakp": controlleridprakp.text,
      "semester": controllersemester.text,
      "tahun": controllertahun.text,
      "nim": controllernim.text,
      "judul_prakp": controllerjudulprakp.text,
      "tools": controllertools.text,
      "lembaga": controllerlembaga.text,
      "pimpinan": controllerpimpinan.text,
      "alamat": controlleralamat.text,
      "fax": controllerfax.text,
      "sk_prakp": controllerskprakp.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Add Data"),),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            new Column(
              children: <Widget>[
                new TextField(
                  controller: controllersemester,
                  decoration: new InputDecoration(
                    hintText: "Semester",
                    labelText: "Semester",
                  ),
                ),
                new TextField(
                  controller: controllertahun,
                  decoration: new InputDecoration(
                    hintText: "Tahun",
                    labelText: "Tahun",
                  ),
                ),
                new TextField(
                  controller: controllernim,
                  decoration: new InputDecoration(
                    hintText: "Nim",
                    labelText: "Nim",
                  ),
                ),
                new TextField(
                  controller: controllerjudulprakp,
                  decoration: new InputDecoration(
                    hintText: "Judul Pra Kp",
                    labelText: "Judul Pra Kp",
                  ),
                ),
                new TextField(
                  controller: controllertools,
                  decoration: new InputDecoration(
                    hintText: "Tools",
                    labelText: "Tools",
                  ),
                ),
                new TextField(
                  controller: controllerlembaga,
                  decoration: new InputDecoration(
                    hintText: "Lembaga",
                    labelText: "Lembaga",
                  ),
                ),
                new TextField(
                  controller: controllerpimpinan,
                  decoration: new InputDecoration(
                    hintText: "Pimpinan",
                    labelText: "Pimpinan",
                  ),
                ),
                new TextField(
                  controller: controlleralamat,
                  decoration: new InputDecoration(
                    hintText: "Alamat",
                    labelText: "Alamat",
                  ),
                ),
                new TextField(
                  controller: controllerfax,
                  decoration: new InputDecoration(
                    hintText: "Fax",
                    labelText: "Fax",
                  ),
                ),
                new TextField(
                  controller: controllerskprakp,
                  decoration: new InputDecoration(
                    hintText: "SK Pra KP",
                    labelText: "SK Pra KP",
                  ),
                ),
                new Padding(padding: const EdgeInsets.all(10.0)),

                new RaisedButton(
                  child: new Text("TAMBAH"),
                  color: Colors.blueAccent,
                  onPressed: (){
                    addDataPraKp();
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
