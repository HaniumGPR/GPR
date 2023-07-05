import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'menu_bar.dart';
import 'art_page_with_img.dart';

class ArtPage extends StatefulWidget {
  const ArtPage({Key? key}) : super(key: key);

  @override
  State<ArtPage> createState() => _ArtPageState();
}

class _ArtPageState extends State<ArtPage> {
  final ImagePicker picker = ImagePicker(); // imagepicker로 갤러리에 있는 이미지 불러옴

  // 갤러리에서 이미지 선택
  Future<void> getImage(BuildContext context, ImageSource imageSource) async {
    final XFile? pickedFile = await picker.pickImage(source: imageSource);

    // 이미지가 제대로 선택되었다면 다음 페이지로 넘어감 -> 오류 발생
    if (pickedFile != null) {
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ArtPagewithImg(imagePath: pickedFile.path),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Container(
              height: 65,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Text(
                    "#예술",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Colors.white,
                      fontFamily: "Nunito Sans",
                      letterSpacing: 2.0,
                    ),
                  ),
                ],
              ),
            ),
            Container(
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
                  )),
            ),
          ],
        ),
        bottomNavigationBar: CustomNavigationBar(),
      ),
    );
  }
}
