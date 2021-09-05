import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_platform/controllers/lecture_controller.dart';
import 'package:the_platform/ui/widgets/Comment.dart';
import 'package:video_player/video_player.dart';

class Home extends StatefulWidget {
  const Home({Key key, @required this.videoLink}) : super(key: key);
  final videoLink;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  LectureController lectureController;
  // ignore: unused_field
  VideoPlayerController _videoController;
  @override
  void initState() {
    super.initState();
    lectureController = Get.find<LectureController>();
    _videoController = VideoPlayerController.network(
      '${widget.videoLink}',
    )..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
      });
  }

  TextEditingController _commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var lectureData = (Get.arguments).lecture;
    // print(lectureData.lecture.id);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0x11818080),
        title: Text(
          (lectureData.name),
          style: TextStyle(color: Color(0xff221f33), fontSize: 26),
        ),
        leading: IconButton(
          icon: Image.asset('assets/images/3st.png'),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
              child: Text(
                "Lecture ${lectureData.id}",
                style: TextStyle(color: Color(0xff221f33), fontSize: 22),
              ),
            ),
            Container(
              child: _videoController.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _videoController.value.aspectRatio,
                      child: VideoPlayer(_videoController),
                    )
                  : Container(
                      height: 400,
                      width: 500,
                      child: Icon(Icons.error_outline),
                    ),
            ),
            SizedBox(
              width: 10,
              height: 10,
            ),
            Column(
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      Text(
                        "About this lecture",
                        style: TextStyle(fontSize: 20),
                      ),
                      Container(
                        width: 338,
                        height: 110,
                        padding: EdgeInsets.fromLTRB(50, 15, 0, 20),
                        child: Table(
                          columnWidths: {2: FlexColumnWidth(0.2)},
                          children: [
                            TableRow(children: [
                              Text("${lectureData.description}"),
                            ]),
                          ],
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Container(
                      //     child: Row(
                      //       children: <Widget>[
                      //         Text(
                      //           "Discussion",
                      //           style: TextStyle(fontSize: 20),
                      //         ),
                      //         Spacer(),
                      //         TextButton(
                      //           child: Text("All Comments(1)"),
                      //           onPressed: () {},
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // Container(
                      //   child: ListTile(
                      //     title: Text("Nermeen Hpopaty"),
                      //     leading: Image.asset(
                      //       "assets/images/6st.png",
                      //     ),
                      //     subtitle: Text("Thank you!"),
                      //     trailing: Icon(
                      //       Icons.favorite,
                      //       color: Colors.red,
                      //     ),
                      //   ),
                      // ),
                      // PopupMenuButton(
                      //     child: ListTile(
                      //       leading: Icon(Icons.comment),
                      //       title: Text('comments'),
                      //     ),
                      //     itemBuilder: (context) {
                      //       return <PopupMenuEntry>[
                      //         //for (var i = 0; i < widget.comments.length; i++)
                      //         PopupMenuItem(
                      //           child: Comment(
                      //               // value: widget.comments[i]['value'],
                      //               ),
                      //         ),
                      //       ];
                      //     }),
                      // Padding(
                      //   padding: const EdgeInsets.all(10.0),
                      //   child: TextField(
                      //     controller: _commentController,
                      //     decoration: InputDecoration(
                      //       border: OutlineInputBorder(),
                      //       hintText: 'comment',
                      //       alignLabelWithHint: true,
                      //       labelText: 'comment',
                      //     ),
                      //   ),
                      // ),
                      // ButtonBar(
                      //   alignment: MainAxisAlignment.end,
                      //   children: [
                      //     TextButton(
                      //       onPressed: () {
                      //         setState(() {
                      //           _commentController.clear();
                      //         });
                      //       },
                      //       child: const Text(
                      //         'clear',
                      //         style: TextStyle(fontSize: 20),
                      //       ),
                      //     ),
                      //     TextButton(
                      // onPressed: () {
                      //   if (_commentController.text.length > 0) {
                      //     setState(() {
                      //       print(_commentController.text);
                      //       comments.add(_commentController.text);
                      //       _commentController.clear();
                      //       Get.snackbar('comment', 'comment added',
                      //           snackPosition: SnackPosition.TOP);
                      //     });
                      //   }
                      // },
                      //       onPressed: () {},
                      //       child: const Text(
                      //         'submit',
                      //         style: TextStyle(fontSize: 20),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // Container(
                      //   margin: EdgeInsets.all(8.0),
                      //   child: TextField(
                      //     decoration: InputDecoration(
                      //       border: OutlineInputBorder(
                      //           borderRadius: BorderRadius.circular(30.0)),
                      //       alignLabelWithHint: true,
                      //       labelText: "Comment",
                      //       labelStyle: TextStyle(fontSize: 16),
                      //       hintText: "write a question, comment...",
                      //       hintStyle: TextStyle(fontSize: 14),
                      //       prefixIcon: Icon(Icons.comment),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              child: Column(
                children: <Widget>[
                  // Padding(
                  //   padding: const EdgeInsets.all(10),
                  //   child: Text(
                  //     "You can download the lecture from here",
                  //     style: TextStyle(fontSize: 20),
                  //   ),
                  // ),
                  RaisedButton(
                    onPressed: () {
                      lectureController.downloadLecture(lectureData.id);
                    },
                    child: Text(
                      'Download PDF',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    color: Color(0xff221f33),
                    splashColor: Colors.white,
                    padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      "Go to quiz page in the website ",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {},
                    child: Text(
                      'QUIZ',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    color: Color(0xffd5b361),
                    splashColor: Colors.white,
                    padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
