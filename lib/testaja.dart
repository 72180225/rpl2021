import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdf_flutter/pdf_flutter.dart';

class TestAja extends StatefulWidget {
  @override
  _TestAjaState createState() => _TestAjaState();
}

class _TestAjaState extends State<TestAja> {
  File localfile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: localfile != null
            ? PDF.file(
          localfile,
          height: 600,
          width: MediaQuery.of(context).size.width * 0.90,
        )
            : RaisedButton(
          child: Text("Grab A File"),
          onPressed: () async {
            File pickedFile = await FilePicker.getFile(
                allowedExtensions: ['pdf'], type: FileType.custom);
            setState(() {
              localfile = pickedFile;
            });
          },
        ),
      ),
    );
  }
}
