import 'package:flutter/material.dart';

class screenA extends StatelessWidget {
  const screenA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('screenA Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.orangeAccent,
                ),
                child: Text('screenB로 이동'),
                onPressed: () {
                  Navigator.pushNamed(context, '/b');
                }),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.orangeAccent,
                ),
                child: Text('screenC로 이동'),
                onPressed: () {
                  Navigator.pushNamed(context, '/c');
                }),
          ],
        ),
      ),
    );
  }
}
