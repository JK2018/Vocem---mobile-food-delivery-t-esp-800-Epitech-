import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchValueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Row(
          children: [
            Text("Vocem",style: TextStyle(color: Colors.black, fontSize: 17),),
            Icon(Icons.mic_external_on,color: Colors.black,size: 19,)
          ],
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      backgroundColor: Colors.white,
      body: Text("HomePage"),
    );
  }
}