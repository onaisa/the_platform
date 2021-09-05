import 'package:flutter/material.dart';

class Comment extends StatelessWidget {
  final String value;
  Comment({Key key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        color: Colors.white,
        height: 50,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'comment :',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('$value'),
          ],
        ),
      ),
    );
  }
}