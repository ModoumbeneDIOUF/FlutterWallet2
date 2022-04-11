import 'package:flutter/material.dart';
import 'package:nafa_money/ScanCode/userImgae.dart';

class TakeImage extends StatefulWidget {
  const TakeImage({ Key? key }) : super(key: key);

  @override
  _TakeImageState createState() => _TakeImageState();
}

class _TakeImageState extends State<TakeImage> {

  String imageUrl = '';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     
      body: ListView(children: [
        const SizedBox(height: 15),

        UserImage(
          onFileChanged: (imageUrl) {
            setState(() {
              this.imageUrl = imageUrl;
            });
          },
        ),
      ])
    );
  }
}