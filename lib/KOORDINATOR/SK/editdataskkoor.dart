import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rpl2021/KOORDINATOR/SK/listskkoor.dart';
import 'package:rpl2021/KP/listkp.dart';
import 'package:rpl2021/PRAKP/listprakp.dart';
import 'package:rpl2021/pengajuanSK/listsk.dart';

import 'detailskkoor.dart';

class EditDataSkKoor extends StatefulWidget {
  final List list;
  final int index;
  EditDataSkKoor({this.index,this.list});

  @override
  _EditDataSkKoorState createState() => _EditDataSkKoorState();
}

class _EditDataSkKoorState extends State<EditDataSkKoor> {
  TextEditingController controlleridsk;
  TextEditingController controllersemester;
  TextEditingController controllertahun;
  TextEditingController controllernim;
  TextEditingController controllerlembaga;
  TextEditingController controllerpimpinan;
  TextEditingController controllernotelp;
  TextEditingController controlleralamat;
  TextEditingController controllerfax;
  TextEditingController controllersurat;


  void editDataPraKp(){
    var url="http://10.0.2.2/rpljaya_2021/editdatask.php";
    http.post(url, body: {
      "id_sk": widget.list[widget.index]['id_sk'],
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
  void initState() {
    // TODO: implement initState
    controllersemester = new TextEditingController(text: widget.list[widget.index]['semester']);
    controllertahun = new TextEditingController(text: widget.list[widget.index]['tahun']);
    controllernim = new TextEditingController(text: widget.list[widget.index]['nim']);
    controllerlembaga = new TextEditingController(text: widget.list[widget.index]['lembaga']);
    controllerpimpinan = new TextEditingController(text: widget.list[widget.index]['pimpinan']);
    controllernotelp = new TextEditingController(text: widget.list[widget.index]['no_telp']);
    controlleralamat = new TextEditingController(text: widget.list[widget.index]['alamat']);
    controllerfax = new TextEditingController(text: widget.list[widget.index]['fax']);
    controllersurat = new TextEditingController(text: widget.list[widget.index]['surat']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Edit Data"),),
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
                    hintText: "No Telp",
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
                  child: new Text("EDIT DATA"),
                  color: Colors.blueAccent,
                  onPressed: (){
                    editDataPraKp();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder:(BuildContext context)=>new ListSkKoor()
                      )
                    );
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
