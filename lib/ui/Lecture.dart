import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_platform/ui/widgets/Comment.dart';

class MyCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String content;
  final String img;
  final List<dynamic> comments;

  MyCard(
      {Key key,
      this.content,
      this.img,
      this.subtitle,
      this.title,
      this.comments})
      : super(key: key);

  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.brown,
      borderOnForeground: true,
      color: Colors.grey.shade300,
      elevation: 10,
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          SizedBox(
              height: 250,
              child: Image.asset(
                widget.img,
                width: double.infinity,
                fit: BoxFit.fill,
              )),
          ListTile(
            leading: Icon(Icons.arrow_drop_down_circle),
            title: Text(widget.title),
            subtitle: Text(
              widget.subtitle,
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              widget.content,
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          PopupMenuButton(
              child: ListTile(
                leading: Icon(Icons.comment),
                title: Text('comments'),
              ),
              itemBuilder: (context) {
                return <PopupMenuEntry>[
                  for (var i = 0; i < widget.comments.length; i++)
                    PopupMenuItem(
                      child: Comment(
                        value: widget.comments[i]['value'],
                      ),
                    ),
                ];
              }),
          TextField(
            controller: _commentController,
            // obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'comment',
              alignLabelWithHint: true,
              labelText: 'comment',
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    _commentController.clear();
                  });
                },
                child: const Text(
                  'clear',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              TextButton(
                onPressed: () {
                  if (_commentController.text.length > 0) {
                    setState(() {
                      widget.comments.add({"value": _commentController.text});
                      _commentController.clear();
                    });
                    Get.snackbar('comment', 'comment added',
                        snackPosition: SnackPosition.BOTTOM);
                  }
                },
                child: const Text(
                  'submit',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
