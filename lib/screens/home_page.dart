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
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text("Catégories",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[500]
            ),),
          Container(
            margin: EdgeInsets.only(top: 8, bottom: 12),
            height: 60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
              Stack(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2018/05/21/23/05/pommes-3419957_960_720.png"),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: 10,
                        child: Icon(
                          Icons.add,
                          size: 15,
                        ),
                      ))
                ]
              ),
                buildFoodCategoryAvatar("https://cdn.pixabay.com/photo/2018/05/21/23/05/pommes-3419957_960_720.png"),
                buildFoodCategoryAvatar("https://cdn.pixabay.com/photo/2015/11/02/20/27/taco-1018962_960_720.jpg"),
                buildFoodCategoryAvatar("https://cdn.pixabay.com/photo/2018/08/03/08/33/food-3581341_960_720.jpg"),
                buildFoodCategoryAvatar("https://cdn.pixabay.com/photo/2017/12/05/20/10/pizza-3000285_960_720.png"),
                buildFoodCategoryAvatar("https://cdn.pixabay.com/photo/2017/09/22/19/05/casserole-dish-2776735_960_720.jpg"),
                buildFoodCategoryAvatar("https://cdn.pixabay.com/photo/2016/07/08/00/43/cream-1503526_960_720.jpg"),
                buildFoodCategoryAvatar("https://cdn.pixabay.com/photo/2020/03/31/01/56/asian-food-4985984_960_720.jpg"),
                buildFoodCategoryAvatar("https://cdn.pixabay.com/photo/2018/02/25/11/17/wine-3180220_960_720.jpg"),

            ],),
          )
        ],),
      ),
    );
  }

  Container buildFoodCategoryAvatar( String url) {
    return Container(
                margin: EdgeInsets.only(left: 18),
                height: 60,
                width: 60,
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.red
                ),
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(url),
                ),
              );
  }
}