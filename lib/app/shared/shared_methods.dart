import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Future<String> getImage() async {
  final ImagePicker _picker = ImagePicker();
  final XFile? image = await _picker.pickImage(
    source: ImageSource.gallery,
  );

  if (image != null) {
    // if (File(image.path).size > 2 && File(image.path).formatSize == 'MB') {
    //   // showFlushBar(context, 'Gambar melebihi batas size 2 MB!');
    //   // return;
    // }

    return image.path;
  }

  return '';
}

Widget generateDashedDivider(double width) {
  int n = width ~/ 5;
  return Row(
    children: List.generate(
        n,
        (index) => (index % 2 == 0)
            ? Container(
                height: 2,
                width: width / n,
                color: Color(0xFFE4E4E4),
              )
            : SizedBox(
                width: width / n,
              )),
  );
}
