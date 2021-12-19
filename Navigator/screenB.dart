import 'package:flutter/material.dart';

class screenB extends StatelessWidget {
  const screenB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('screenB Page'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.orangeAccent,
          ),
          child: Text('이전 페이지로'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
