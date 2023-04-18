import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  XFile? image;

  final ImagePicker picker = ImagePicker();

  bool checkText1 = false;
  bool checkText2 = false;
  bool checkText3 = false;
  bool checkImage = false;

  Offset offset = Offset.zero;
  Offset offset2 = Offset.zero;
  Offset offset3 = Offset.zero;
  Offset offset4 = Offset.zero;

  String text1 = 'Tap To change text';
  String text2 = 'Tap To change text';
  String text3 = 'Tap To change text';

  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

  void imagePopUp() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () async {
                      Navigator.pop(context);
                      await getImage(ImageSource.gallery);
                      checkImage = true;
                      setState(() {});
                    },
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        Text(' From Gallery'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                      checkImage = true;
                      setState(() {});
                    },
                    child: Row(
                      children: [
                        Icon(Icons.camera),
                        Text(' From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        title: Text(
          'Meme King Simulator',
          style: GoogleFonts.poppins(
              fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
        ),
      ),
      body: ListView(
        children: [
          Container(
            child: Stack(
              children: [
                Container(child: Image.network(widget.url)),
                Visibility(
                  visible: checkText1,
                  child: Positioned(
                    left: offset.dx,
                    top: offset.dy,
                    child: GestureDetector(
                      onTap: () {
                        TextEditingController controller =
                            TextEditingController();
                        print('object');
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: TextFormField(
                                    controller: controller,
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      setState(() {
                                        text1 = controller.text;
                                      });
                                    },
                                    child: Text('Done'))
                              ],
                            ),
                          ),
                        );
                      },
                      onPanUpdate: (details) {
                        print('aaa');
                        setState(() {
                          offset = Offset(offset.dx + details.delta.dx,
                              offset.dy + details.delta.dy);
                        });
                      },
                      child: SizedBox(
                        width: 300,
                        height: 300,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(text1,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 28.0,
                                    color: Colors.black)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: checkText2,
                  child: Positioned(
                    left: offset2.dx,
                    top: offset2.dy,
                    child: GestureDetector(
                      onTap: () {
                        TextEditingController controller =
                            TextEditingController();
                        print('object');
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: TextFormField(
                                    controller: controller,
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      setState(() {
                                        text2 = controller.text;
                                      });
                                    },
                                    child: Text('Done'))
                              ],
                            ),
                          ),
                        );
                      },
                      onPanUpdate: (details) {
                        print('aaa');
                        setState(() {
                          offset2 = Offset(offset2.dx + details.delta.dx,
                              offset2.dy + details.delta.dy);
                        });
                      },
                      child: SizedBox(
                        width: 300,
                        height: 300,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(text2,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 28.0,
                                    color: Colors.black)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: checkText3,
                  child: Positioned(
                    left: offset3.dx,
                    top: offset3.dy,
                    child: GestureDetector(
                      onTap: () {
                        TextEditingController controller =
                            TextEditingController();
                        print('object');
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: TextFormField(
                                    controller: controller,
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      setState(() {
                                        text3 = controller.text;
                                      });
                                    },
                                    child: Text('Done'))
                              ],
                            ),
                          ),
                        );
                      },
                      onPanUpdate: (details) {
                        setState(() {
                          offset3 = Offset(offset3.dx + details.delta.dx,
                              offset3.dy + details.delta.dy);
                        });
                      },
                      child: SizedBox(
                        width: 300,
                        height: 300,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(text3,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 28.0,
                                    color: Colors.black)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: checkImage,
                  child: Positioned(
                    left: offset4.dx,
                    top: offset4.dy,
                    child: GestureDetector(
                        onPanUpdate: (details) {
                          print('object');
                          setState(() {
                            offset4 = Offset(offset4.dx + details.delta.dx,
                                offset4.dy + details.delta.dy);
                          });
                        },
                        child: checkImage == true
                            ? Container(
                                width: 125,
                                height: 125,
                                child: Image.file(
                                  File(image!.path),
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Container()),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 20,
              ),
              TextButton(
                onPressed: () {
                  if (checkImage == false) {
                    imagePopUp();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content:
                            Text('You only need one to make a good meme :)'),
                      ),
                    );
                  }
                },
                child: Row(
                  children: [
                    Icon(Icons.image),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Add Image',
                      style: GoogleFonts.poppins(
                          fontSize: 12, color: Colors.black),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
              TextButton(
                onPressed: () {
                  if (checkText1 == false) {
                    setState(() {
                      checkText1 = true;
                    });
                  } else if (checkText2 == false && checkText1 == true) {
                    setState(() {
                      checkText2 = true;
                    });
                  } else if (checkText1 == true &&
                      checkText2 == true &&
                      checkText3 == false) {
                    setState(() {
                      checkText3 = true;
                    });
                  }
                },
                child: Row(
                  children: [
                    Icon(Icons.font_download),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Add Text',
                      style: GoogleFonts.poppins(
                          fontSize: 12, color: Colors.black),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
              TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.navigate_next_sharp,
                      size: 35,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Done',
                      style: GoogleFonts.poppins(
                          fontSize: 12, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
