import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddDataKp extends StatefulWidget {
  @override
  _AddDataKpState createState() => _AddDataKpState();
}

class _AddDataKpState extends State<AddDataKp> {


  TextEditingController controlleridkp = new TextEditingController();
  TextEditingController controllersemester = new TextEditingController();
  TextEditingController controllertahun = new TextEditingController();
  TextEditingController controllernim = new TextEditingController();
  TextEditingController controllerjudulkp = new TextEditingController();
  TextEditingController controllertools = new TextEditingController();
  TextEditingController controllerlembaga = new TextEditingController();
  TextEditingController controllerpimpinan = new TextEditingController();
  TextEditingController controlleralamat = new TextEditingController();
  TextEditingController controllerfax = new TextEditingController();
  TextEditingController controllerskkp = new TextEditingController();


  void addData(){
    var url="http://10.0.2.2/rpljaya_2021/adddatakp.php";

    http.post(url, body: {
      "id_kp": controlleridkp.text,
      "semester": controllersemester.text,
      "tahun": controllertahun.text,
      "nim": controllernim.text,
      "judul_kp": controllerjudulkp.text,
      "tools": controllertools.text,
      "lembaga": controllerlembaga.text,
      "pimpinan": controllerpimpinan.text,
      "alamat": controlleralamat.text,
      "fax": controllerfax.text,
      "sk_kp": controllerskkp.text,
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
                  controller: controllerjudulkp,
                  decoration: new InputDecoration(
                    hintText: "Judul Kp",
                    labelText: "Judul Kp",
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
                  controller: controllerskkp,
                  decoration: new InputDecoration(
                    hintText: "SK KP",
                    labelText: "SK KP",
                  ),
                ),
                new Padding(padding: const EdgeInsets.all(10.0)),

                new RaisedButton(
                  child: new Text("TAMBAH"),
                  color: Colors.blueAccent,
                  onPressed: (){
                    addData();
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
