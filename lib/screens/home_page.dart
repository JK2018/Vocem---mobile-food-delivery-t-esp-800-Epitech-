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
          ),
            Container(
              height: 2,
              color: Colors.grey[300],
              margin: EdgeInsets.symmetric(horizontal: 30),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.only(top: 8),
                children: [
                  buildRestoCard("https://cdn.pixabay.com/photo/2015/03/01/20/08/new-york-655215_960_720.jpg"),
                  buildRestoCard("https://cdn.pixabay.com/photo/2015/11/23/19/20/glass-1058878_960_720.jpg"),
                  buildRestoCard("https://cdn.pixabay.com/photo/2021/02/17/15/01/comida-6024545_960_720.jpg"),
                ],
              ),
            )
        ],),
      ),
    );
  }

  Container buildRestoCard(String urlImg) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildRestoRow(),
                      SizedBox(height: 10,),

                      buildRestoPicture(urlImg),
                      SizedBox(height: 5,),
                      Text("963 likes",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800]
                      ),
                      ),
                      SizedBox(height: 8,),

                ],),);
  }

  Row buildRestoRow() {
    return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 15,
                                backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2014/07/08/13/43/donalds-387237_960_720.jpg"),
                              ),
                              SizedBox(width: 5,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("macdo",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text("fastfood",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: Colors.grey[500]
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          Icon(Icons.more_vert)
                        ],
                      );
  }

  Stack buildRestoPicture(urlImg) {
    return Stack(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.width-50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 20,
                                  offset: Offset(0,10),
                                )
                              ],
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                  image: NetworkImage(urlImg))
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            right: 20,
                              child: Icon(
                                Icons.favorite,
                                size: 35,
                                color: Colors.white.withOpacity(0.9),))
                        ],
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