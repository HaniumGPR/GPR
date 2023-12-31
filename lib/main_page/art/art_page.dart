import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:palette_generator/palette_generator.dart';

import '../../menu_bar.dart';
import '../utils/show_single_category.dart';
import 'art_page_with_img.dart';

class ArtPage extends StatefulWidget {
  const ArtPage({Key? key}) : super(key: key);

  @override
  State<ArtPage> createState() => _ArtPageState();
}

class _ArtPageState extends State<ArtPage> {
  final ImagePicker picker = ImagePicker();

  // 갤러리에서 이미지 선택
  Future<void> getImage(BuildContext context, ImageSource imageSource) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    // 이미지가 제대로 선택되었다면 다음 페이지로 넘어감
    if (pickedFile != null) {
      // ignore: use_build_context_synchronously

      final PaletteGenerator paletteGenerator =
          await PaletteGenerator.fromImageProvider(
        FileImage(File(pickedFile.path)),
      );

      List<Color> colorList = paletteGenerator.paletteColors
          .map((paletteColor) => paletteColor.color)
          .toList();
      List<int> colorCodeList = colorList.map((color) => color.value).toList();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ArtPagewithImg(
              imagePath: pickedFile.path, colorCodeList: colorCodeList),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            showSingleCategory("#예술"),
            SizedBox(
              width: 300,
              height: 300,
              child: TextButton(
                onPressed: () => getImage(context, ImageSource.gallery),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black38,
                  padding: EdgeInsets.all(5),
                  alignment: Alignment.center,
                ),

                // 사진선택 버튼
                child: Text(
                  "사진 선택",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                    color: Colors.black,
                    fontFamily: "Nunito Sans",
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: CustomNavigationBar(),
      ),
    );
  }
}
