import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FileUploadButton extends StatelessWidget {
  const FileUploadButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text('UPLOAD FILE'),
      onPressed: () async {
        var picked = await FilePicker.platform.pickFiles();

        if (picked != null) {
          print(picked.files.first.name);
        }
      },
    );
  }
}
