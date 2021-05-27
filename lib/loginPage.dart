import 'package:flutter/material.dart';

import 'global_vars.dart';










// Create a Form widget.
class MyLoginForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyLoginForm> {
  final _formKey = GlobalKey<FormState>();
  bool isChecked = false;



  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            //initialValue: checkForUsername(),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "required";
              }
              return null;
            },
            cursorColor: Colors.blueGrey,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: c1),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Username",
              )
          ),
          Text(""),
          TextFormField(
            //initialValue: checkForUsername(),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "required";
                }
                return null;
              },
              cursorColor: Colors.blueGrey,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: c1),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Password",
              )
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                  //Navigator.push(
                    //context,
                    //MaterialPageRoute(builder: (context) => HomeRoute()),
                  //);
              },
              child: Text('Sign In'),
              style: ElevatedButton.styleFrom(
                primary: c1
              ),
            ),
          ),
          CheckboxListTile(
            title: Icon(
              Icons.vpn_key_outlined,
              color: c1,
              size: 30.0,
            ),
            value: isChecked,
            onChanged: (bool value) {
              setState(() {
                isChecked = value;
                //////////////////////////// SAVE USERNAME IN DB
              });
            },
            controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
          )
        ],
      ),
    );
  }
}