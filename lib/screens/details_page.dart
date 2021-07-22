import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vocem/custom_widgets/custom_widgets_index.dart';
import 'package:vocem/global_vars.dart';
import 'package:vocem/screens/menu_card.dart';

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[300],
        elevation: 0,
        leading: IconButton(
          //icon: SvgPicture.asset("assets/images/menu.svg"),
          icon: Icon(Icons.arrow_back_ios_outlined),
          onPressed: ()=>print("salut"),
        ),
      ),
      body: Column(
        children: [
          Flexible(
            flex: 3,
            child: Container(
              color: Colors.white,
              height: 150,
              margin: EdgeInsets.only(bottom: 10),
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20,right: 20, bottom: 30),
                    height: 136,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[300],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(35),
                        bottomRight: Radius.circular(35)
                      ),
                    ),
                    child: Row(
                      children: [
                        Text('MacDo', style: TextStyle(color: Colors.white, fontSize: 20),),
                        Spacer(),
                        Image.network("https://i.pinimg.com/originals/c7/c6/d4/c7c6d4e62a2f96134ee819240dd07390.jpg",
                        height: 30,)
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child:  Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.deepPurple[100],
                              blurRadius: 40,
                              offset: Offset(0, 8), // Shadow position
                            ),
                          ],
                        ),
                        child: InputCustom(
                          width: 300,
                          showText: false,
                          placeholder: "Menu",
                          backgroundColor: c4, // Colors.white,
                          //controller: usernameController,
                          keyboardType: TextInputType.text,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
                height: 30,
                margin: EdgeInsets.all(10),child: Text('Menus', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),)),
          ),
          Flexible(
            flex: 6,
            child: Container(
              height: size.height-(size.height*0.5),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    MenuCard(),
                    MenuCard(),
                    MenuCard(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
