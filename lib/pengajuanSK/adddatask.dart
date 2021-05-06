import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddDataSk extends StatefulWidget {
  @override
  _AddDataSkState createState() => _AddDataSkState();
}

class _AddDataSkState extends State<AddDataSk> {

  TextEditingController controlleridsk = new TextEditingController();
  TextEditingController controllersemester = new TextEditingController();
  TextEditingController controllertahun = new TextEditingController();
  TextEditingController controllernim = new TextEditingController();
  TextEditingController controllerlembaga = new TextEditingController();
  TextEditingController controllerpimpinan = new TextEditingController();
  TextEditingController controllernotelp = new TextEditingController();
  TextEditingController controlleralamat = new TextEditingController();
  TextEditingController controllerfax = new TextEditingController();
  TextEditingController controllersurat = new TextEditingController();


  void addDataSk(){
    var url="http://10.0.2.2/rpljaya_2021/adddatask.php";

    http.post(url, body: {
      "id_sk": controlleridsk.text,
      "semester": controllersemester.text,
      "tahun": controllertahun.text,
      "nim": controllernim.text,
      "lembaga": controllerlembaga.text,
      "pimpinan": controllerpimpinan.text,
      "no_telp": controllernotelp.text,
      "alamat": controlleralamat.text,
      "fax": controllerfax.text,
      "surat": controllersurat.text,
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
                  controller: controllernotelp,
                  decoration: new InputDecoration(
                    hintText: "No telp",
                    labelText: "No Telp",
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
                  controller: controllersurat,
                  decoration: new InputDecoration(
                    hintText: "SK",
                    labelText: "SK",
                  ),
                ),
                new Padding(padding: const EdgeInsets.all(10.0)),

                new RaisedButton(
                  child: new Text("TAMBAH"),
                  color: Colors.blueAccent,
                  onPressed: (){
                    addDataSk();
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
