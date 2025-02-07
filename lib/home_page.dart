import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<File> imagesPath = [];
  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text("Images"),
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            ListView(
              //make the ListView not scrollable
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              //generate list of images
              children: List.generate(
                imagesPath.length,
                (index) {
                  return Image.file(
                    imagesPath[index],
                    fit: BoxFit.cover,
                    height: 200,
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: () async {
                  final List<XFile> images = await picker.pickMultiImage();
                  //loop in images to take their path
                  for (var image in images) {
                    imagesPath.add(File(image.path));
                  }
                  setState(() {});
                },
                child: Text("Pick Image"))
          ],
        ),
      ),
    );
  }
}
