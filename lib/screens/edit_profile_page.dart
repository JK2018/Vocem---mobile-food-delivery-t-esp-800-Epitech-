

import 'package:flutter/material.dart';
import 'package:vocem/screens/settings_page.dart';
import 'package:image_picker/image_picker.dart';
import '../global_vars.dart';





class EditProfilePage extends StatefulWidget {
  EditProfilePage({Key key}) : super(key: key);
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}


class _EditProfilePageState extends State<EditProfilePage> {
  final picker = ImagePicker();
  bool showPassword = false;
  String profileImage = "https://cdn.pixabay.com/photo/2018/08/27/15/45/cat-3635300_1280.jpg";

  Future changeProfileImage() async {
    setState(() {
      // select pic from gallery and asign it to profileImage
      profileImage = "https://cdn.pixabay.com/photo/2019/11/11/05/31/profanity-4617257_1280.jpg";
    });
  }


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
          IconButton(icon: Icon(Icons.settings, color: c1,), onPressed: (){
            navigateToSettings(context);
          })
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {FocusScope.of(context).unfocus();},
          child: (
            ListView(
              children: [
                Text("Edition Profile",
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
                            image: NetworkImage(profileImage)
                          )
                        ),
                      ),
                      Positioned(bottom: 0, right: 0,child:
                      GestureDetector(
                        onTap: (){
                          changeProfileImage();
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: c2,
                              shape: BoxShape.circle,
                              border: Border.all(width: 4, color: Theme.of(context).scaffoldBackgroundColor,)),
                          child: Icon(Icons.edit, color: Colors.white,),
                        ),
                      ))
                    ],
                  ),
                ),
                SizedBox(height: 35,),
                buildTextField("Nom & Prenom", "John Rambo",false),
                buildTextField("Email", "gros_muscles@guns.com",false),
                buildTextField("Mot de passe", "*********",true),
                buildTextField("Localisation", "Paris, France",false),
                SizedBox(height: 35,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // ignore: deprecated_member_use
                    RaisedButton(
                        onPressed: (){},
                        color: c2,
                        elevation: 2,
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          "ENREGISTRER",
                          style: TextStyle(fontSize: 14, letterSpacing: 2.2, color: Colors.white),
                        )
                    ),
                  ],
                )
              ],
            )
          ),
        ),
      ),
    );
  }





  Widget buildTextField(String labelText, String placeholder, bool isPasswordTextField){
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? !showPassword : true,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField ? IconButton(
                icon: Icon(Icons.remove_red_eye, color: c1,),
                onPressed: () {
                  setState((){
                    showPassword = !showPassword;
                  });
                }) : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelText: labelText,
            labelStyle: TextStyle(
                color: c2,
              fontWeight: FontWeight.bold
            ),
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: c2, width: 3),
            //  when the TextFormField in focused
          ) ,
        ),
      ),
    );
  }

}


Future navigateToSettings(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
}

















