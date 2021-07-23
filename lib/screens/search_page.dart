import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:vocem/custom_widgets/custom_widgets_index.dart';

import '../global_vars.dart';
import 'cart.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String searchValue;
  bool noData = true;
  TextEditingController searchValueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "Vocem",
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                  Icon(
                    Icons.mic_external_on,
                    color: Colors.black,
                    size: 19,
                  )
                ],
              ),
              RawMaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Cart()),
                  );
                },
                elevation: 2.0,
                fillColor: c2,
                child: Icon(
                  Icons.shopping_cart_outlined,
                  size: 27.0,
                ),
                padding: EdgeInsets.all(8.0),
                shape: CircleBorder(),
              )
            ],
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      backgroundColor: Colors.white,
      body: !noData
          ? Center(
              child: Text(
              "Prenez une photo",
              style: TextStyle(fontSize: 20),
            ))
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: InputCustom(
                        width: 300,
                        height: 50,
                        showText: false,
                        placeholder: "Rechercher",
                        backgroundColor: c4,
                        //Colors.white,
                        controller: searchValueController,
                        keyboardType: TextInputType.text,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: Theme(
                      data: Theme.of(context).copyWith(accentColor: Colors.red),
                      child: RefreshIndicator(
                          onRefresh: () async {
                            await Future.delayed(Duration(seconds: 2));
                            setState(() {
                              //write an function to get all albums/pics
                            });
                            return null;
                          },
                          child: ListView(
                            children: [Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      child: Text("Burger", textAlign: TextAlign.start,
                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: c2, backgroundColor: Colors.white),),
                                      height: 150,
                                      width: MediaQuery.of(context).size.width / 2 - 20,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.3),
                                              spreadRadius: 2,
                                              blurRadius: 20,
                                              offset: Offset(0, 10),
                                            )
                                          ],
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  "https://cdn.pixabay.com/photo/2016/03/05/19/02/hamburger-1238246_960_720.jpg"))),
                                    ),


                                    Container(
                                      child: Text("Sushi", textAlign: TextAlign.start,
                                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: c2, backgroundColor: Colors.white),),
                                      height: 150,
                                      width: MediaQuery.of(context).size.width / 2 - 20,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                              Colors.black.withOpacity(0.3),
                                              spreadRadius: 2,
                                              blurRadius: 20,
                                              offset: Offset(0, 10),
                                            )
                                          ],
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  "https://cdn.pixabay.com/photo/2014/05/26/14/54/sushi-354629_960_720.jpg"))),
                                    ),
                                  ],
                                ),

                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      child: Text("Pizza", textAlign: TextAlign.start,
                                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: c2, backgroundColor: Colors.white),),
                                      height: 150,
                                      width: MediaQuery.of(context).size.width / 2 - 20,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                              Colors.black.withOpacity(0.3),
                                              spreadRadius: 2,
                                              blurRadius: 20,
                                              offset: Offset(0, 10),
                                            )
                                          ],
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  "https://cdn.pixabay.com/photo/2016/04/09/09/22/pizza-1317699_960_720.jpg"))),
                                    ),


                                    Container(
                                      child: Text("Tex Mex", textAlign: TextAlign.start,
                                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: c2, backgroundColor: Colors.white),),
                                      height: 150,
                                      width: MediaQuery.of(context).size.width / 2 - 20,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                              Colors.black.withOpacity(0.3),
                                              spreadRadius: 2,
                                              blurRadius: 20,
                                              offset: Offset(0, 10),
                                            )
                                          ],
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  "https://cdn.pixabay.com/photo/2017/06/29/20/09/mexican-2456038_960_720.jpg"))),
                                    ),
                                  ],
                                ),

                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      child: Text("BBQ", textAlign: TextAlign.start,
                                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: c2, backgroundColor: Colors.white),),
                                      height: 150,
                                      width: MediaQuery.of(context).size.width / 2 - 20,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                              Colors.black.withOpacity(0.3),
                                              spreadRadius: 2,
                                              blurRadius: 20,
                                              offset: Offset(0, 10),
                                            )
                                          ],
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  "https://cdn.pixabay.com/photo/2016/03/05/20/07/abstract-1238657_960_720.jpg"))),
                                    ),


                                    Container(
                                      child: Text("Wok", textAlign: TextAlign.start,
                                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: c2, backgroundColor: Colors.white),),
                                      height: 150,
                                      width: MediaQuery.of(context).size.width / 2 - 20,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                              Colors.black.withOpacity(0.3),
                                              spreadRadius: 2,
                                              blurRadius: 20,
                                              offset: Offset(0, 10),
                                            )
                                          ],
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  "https://cdn.pixabay.com/photo/2015/09/29/11/30/wok-963754_960_720.jpg"))),
                                    ),
                                  ],
                                ),

                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      child: Text("Healthy", textAlign: TextAlign.start,
                                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: c2, backgroundColor: Colors.white),),
                                      height: 150,
                                      width: MediaQuery.of(context).size.width / 2 - 20,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                              Colors.black.withOpacity(0.3),
                                              spreadRadius: 2,
                                              blurRadius: 20,
                                              offset: Offset(0, 10),
                                            )
                                          ],
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  "https://cdn.pixabay.com/photo/2017/10/09/19/29/eat-2834549_960_720.jpg"))),
                                    ),


                                    Container(
                                      child: Text("Indian", textAlign: TextAlign.start,
                                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: c2, backgroundColor: Colors.white),),
                                      height: 150,
                                      width: MediaQuery.of(context).size.width / 2 - 20,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                              Colors.black.withOpacity(0.3),
                                              spreadRadius: 2,
                                              blurRadius: 20,
                                              offset: Offset(0, 10),
                                            )
                                          ],
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  "https://cdn.pixabay.com/photo/2017/09/09/12/09/india-2731817_960_720.jpg"))),
                                    ),
                                  ],
                                ),


                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      child: Text("Halal", textAlign: TextAlign.start,
                                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: c2, backgroundColor: Colors.white),),
                                      height: 150,
                                      width: MediaQuery.of(context).size.width / 2 - 20,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                              Colors.black.withOpacity(0.3),
                                              spreadRadius: 2,
                                              blurRadius: 20,
                                              offset: Offset(0, 10),
                                            )
                                          ],
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  "https://cdn.pixabay.com/photo/2018/05/29/20/47/couscous-3440042_960_720.jpg"))),
                                    ),


                                    Container(
                                      child: Text("Pasta", textAlign: TextAlign.start,
                                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: c2, backgroundColor: Colors.white),),
                                      height: 150,
                                      width: MediaQuery.of(context).size.width / 2 - 20,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                              Colors.black.withOpacity(0.3),
                                              spreadRadius: 2,
                                              blurRadius: 20,
                                              offset: Offset(0, 10),
                                            )
                                          ],
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  "https://cdn.pixabay.com/photo/2018/07/18/19/12/spaghetti-3547078_960_720.jpg"))),
                                    ),
                                  ],
                                ),
                              ],
                            )]
                          )),
                    ),
                  )
                ],
              ),
            ),
      /**floatingActionButton: FloatingActionButton(
        child: Icon(Icons.shopping_cart_outlined),
        backgroundColor: Colors.black,
        onPressed: () {
          navigateToCart(context);
          //details pages
        },
      ),**/
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

Future navigateToCart(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
}
