import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  final String postId;

  SecondPage({Key key, @required this.postId}) : super(key: key);
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wordpress OneSignal'),
        elevation: 0,
      ),
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Text(this.widget.postId),
      ),
    );
  }
}
