import 'package:flutter/material.dart';

import '../global_vars.dart';

class EditProfilePage extends StatefulWidget {
  EditProfilePage({Key key}) : super(key: key);
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}


class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pofile",
          style: TextStyle(
            color: Colors.black,
          ),),
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          IconButton(icon: Icon(Icons.settings, color: c1,), onPressed: (){})
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {FocusScope.of(context).unfocus();},
          child: (
            ListView(
              children: [
                Text("Modifier Profile",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),),
                SizedBox(height: 20,),
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 2, blurRadius: 10,
                              color: Colors.black.withOpacity(0.2),
                              offset: Offset(0,10)
                            )
                          ],
                          border: Border.all(width: 4, color: c2),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage("https://cdn.pixabay.com/photo/2018/08/27/15/45/cat-3635300_1280.jpg")
                          )
                        ),
                      ),
                      Positioned(bottom: 0, right: 0,child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: c2,
                            shape: BoxShape.circle,
                            border: Border.all(width: 4, color: Theme.of(context).scaffoldBackgroundColor,)),
                        child: Icon(Icons.edit, color: Colors.white,),
                      ))
                    ],
                  ),
                ),
                SizedBox(height: 35,),
                buildTextField("Nom & Prenom", "John Rambo",false),
                buildTextField("Email", "gros_muscles@guns.com",false),
                buildTextField("Mot de passe", "*********",true),
                buildTextField("Localisation", "Paris, France",false),
              ],
            )
          ),
        ),
      ),
    );
  }
}


Padding buildTextField(String labelText, String placeholder, bool isPasswordTextField){
  return Padding(
    padding: const EdgeInsets.only(bottom: 35.0),
    child: TextField(
      obscureText: isPasswordTextField,
      decoration: InputDecoration(
          suffixIcon: isPasswordTextField ? IconButton(
              icon: Icon(Icons.remove_red_eye, color: c1,),
              onPressed: (){}) : null,
          contentPadding: EdgeInsets.only(bottom: 3),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: labelText,
          hintText: placeholder,
          hintStyle: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold,
            color: Colors.black,
          )
      ),
    ),
  );
}















