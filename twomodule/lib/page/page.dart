import 'package:flutter/material.dart';

class PagePage extends StatefulWidget {
  const PagePage({Key? key}) : super(key: key);

  @override
  State<PagePage> createState() => _PagePageState();
}

class _PagePageState extends State<PagePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: const Text("two  Page"),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'two  Page',
            ),
          ],
        ),
      ),
    );
  }
}
