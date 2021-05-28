import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../global_vars.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool valSwitch1 = false;
  bool valSwitch2 = true;
  bool valSwitch3 = false;
  onSwitchChangeMethod1(bool newValue1){
    setState(() {
      valSwitch1 = newValue1;
    });
  }
  onSwitchChangeMethod2(bool newValue2){
    setState(() {
      valSwitch2 = newValue2;
    });
  }
  onSwitchChangeMethod3(bool newValue3){
    setState(() {
      valSwitch3 = newValue3;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Paramètres",
          style: TextStyle(
            color: Colors.black,
          ),),
        leading: BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            Text("Edition Paramètres",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),),
            SizedBox(height: 40,),
            Row(
              children: [
                Icon( Icons.person, color: c2,),
                SizedBox(width: 8,),
                Text(
                  "Compte",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Divider(height: 15, thickness: 2,),
            SizedBox(height: 10,),
            buildAccountOptionRow(context, "Mot de Passe", ["Changer de mot de passe"]),
            buildAccountOptionRow(context, "Préférences",["Thèmes", "Devises"]),
            buildAccountOptionRow(context, "Langue",["Français", "English", "Espanol"]),
            buildAccountOptionRow(context, "Privacité & Sécurité",["Cookies", "Tracking"]),
            buildAccountOptionRow(context, "Moyens de Paiement",["Mes CBs", "Ajouter une CB", "Supprimer une CB"]),
            SizedBox(height: 40,),
            Row(
              children: [
                Icon( Icons.volume_up_outlined, color: c2,),
                SizedBox(width: 8,),
                Text(
                  "Notifications",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Divider(height: 15, thickness: 2,),
            SizedBox(height: 10,),
            buildNotificationOptionRow("Livraison", valSwitch1, onSwitchChangeMethod1),
            buildNotificationOptionRow("Commande", valSwitch2, onSwitchChangeMethod2),
            buildNotificationOptionRow("Promos", valSwitch3, onSwitchChangeMethod3),
            SizedBox(
              height: 50,
            ),
            Center(
              // ignore: deprecated_member_use
              child: RaisedButton(
                padding: EdgeInsets.symmetric(horizontal: 40),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                onPressed: (){},
                color: c2,
                child: Text("Deconnexion",
                style: TextStyle(fontSize: 16, letterSpacing: 2.2, color: Colors.black),),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row buildNotificationOptionRow(String title, bool valSwitch, Function onChangeMethod) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey[600]),
              ),
              Transform.scale(
                  scale: 0.7,
                  child: CupertinoSwitch(
                      activeColor: c2,
                      value: valSwitch,
                      onChanged: (newValue){
                      setState((){
                        onChangeMethod(newValue);
                      });

                  })),
            ],
          );
  }

  GestureDetector buildAccountOptionRow(BuildContext context, String title, List<String> options) {
    List<Widget> addChildren() {
       List<Widget>newList = [];
       options.forEach((option) => {
         newList.add(
           Text(
             option,
             style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),)
       });
       return newList;
    }
          return GestureDetector(
          onTap: (){
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(title),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: addChildren(),),
                  actions: [
                    // ignore: deprecated_member_use
                    FlatButton(onPressed: (){
                      Navigator.of(context).pop();
                    }, child: Text("Fermer",
                    style: TextStyle(color: c2, fontWeight: FontWeight.bold, fontSize: 18),))
                  ],
                );
              },
              );
          },

            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.grey[600]),
                    ),
                    Icon(Icons.arrow_forward_ios, color: c2,)
                  ],
                ),
            ),
          );
  }
}














