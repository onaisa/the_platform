import 'package:flutter/material.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: ListView.separated(
          itemBuilder: (BuildContext context, int i) {
            return SavedItem();
          },
          separatorBuilder: (BuildContext context, int i) {
            return SizedBox(
              height: 8.0,
            );
          },
          itemCount: 10),
    );
  }
}

Widget SavedItem() {
  return Container(
    height: 100,
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Card(
        // color: Colors.blueGrey[50],
        elevation: 3.0,
        child: ListTile(
          leading: Icon(
            Icons.bookmark,
            color: Colors.indigo,
          ),
          title: Text(
            'Lrcture title',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            'sub title',
            style: TextStyle(fontSize: 18),
          ),
        )),
  );
}
