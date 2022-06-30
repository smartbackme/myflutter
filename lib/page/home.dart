import 'package:commonmodule/commonmodule.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    ULog.d("message");
    LibAppResponsitory.instance.testLogin("account", "password", "identityType");
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: const Text("home"),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
             Text(
              'home',
            ),
          ],
        ),
      ),
    );
  }
}
