import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vocem/custom_widgets/custom_widgets_index.dart';
import 'package:vocem/routes/pagination.dart';
import 'package:vocem/screens/screens_index.dart';

import '../global_vars.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  bool signInOrUp = true;
  String username;
  String password;
  TextEditingController usernameController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Wrap(
                runAlignment: WrapAlignment.center,
                runSpacing: 30,
                alignment: WrapAlignment.center,
                children: [
                  Text("Vocem",
                  style: TextStyle(color: c4,fontSize: 35, fontWeight: FontWeight.bold),),
                  Image.asset('assets/images/vocem_logo.png',width: 50,height: 50,),
                  InputCustom(
                    width: 300,
                    showText: false,
                    placeholder: "Email",
                    backgroundColor: c4, // Colors.white,
                    controller: usernameController,
                    keyboardType: TextInputType.text,
                  ),
                  InputCustom(
                    width: 300,
                    showText: false,
                    placeholder: "Password",
                    backgroundColor: c4, // Colors.white,
                    controller: pwdController,
                    keyboardType: TextInputType.text,
                  ),
                  signInOrUp ? BtnCustom(
                    width: 300,
                    textBtn: "Connexion",
                    iconName: Icons.person,
                    btnColor: c4, // Colors.white,
                    textColor: Colors.black,
                    onPress: signIn,
                  ) : BtnCustom(
                    width: 300,
                    textBtn: "Inscription",
                    iconName: Icons.person,
                    btnColor: c4, // Colors.white,
                    textColor: Colors.black,
                    onPress: (){print("SignUp");},
                  ),
                  GestureDetector(
                    onTap: (){setState(() {
                      signInOrUp=!signInOrUp;
                    });},
                    child: signInOrUp ?
                    Text("Taper ici pour créer son compte",
                    style: TextStyle(color: c4,decoration: TextDecoration.underline)):
                   Text("Taper ici pour vous connectez",
                    style: TextStyle(color: c4,decoration: TextDecoration.underline)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  signIn(){
    print("SignIn");
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => Pagination()),
          (Route<dynamic> route) => false,
    );
  }
}
