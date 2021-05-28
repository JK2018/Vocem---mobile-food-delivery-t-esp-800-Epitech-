import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:vocem/custom_widgets/custom_widgets_index.dart';

import '../global_vars.dart';
import 'cart.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String searchValue;
  bool noData=true;
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
        backgroundColor: Colors.grey[200],
        elevation: 1,
      ),
      backgroundColor: Colors.white,
      body: !noData ? Center(child: Text("Prenez une photo", style: TextStyle(fontSize: 20),))
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
                  backgroundColor: c4, //Colors.white,
                  controller: searchValueController,
                  keyboardType: TextInputType.text,
                ),
              ),
            ),
            SizedBox(height: 15,),
            Expanded(
              child: Theme(
                data:
                Theme.of(context).copyWith(accentColor: Colors.red),
                child: RefreshIndicator(
                  onRefresh: () async {
                    await Future.delayed(Duration(seconds: 2));
                    setState(() {
                      //write an function to get all albums/pics
                    });
                    return null;
                  },
                  child: StaggeredGridView.countBuilder(
                    crossAxisCount: 4,
                    itemBuilder: (BuildContext context, int index) =>
                        Container(
                          child: CustomCard(
                            height: 110,
                            text: "MacDo",
                            img: "https://www.sohealthy.fr/wp-content/uploads/2017/06/mcdo-calories-menu-770x560.jpg",
                            cardColor: c4, // Colors.white,
                            onTap: (){
                              print("show album details");
                              /*Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DepositScreen()));*/
                            },
                          ),
                        ),
                    staggeredTileBuilder: (int index) =>
                        StaggeredTile.fit(2),
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 5,
                    itemCount: 5,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.shopping_cart_outlined),
        backgroundColor: Colors.black,
        onPressed: (){
          navigateToCart(context);
          //details pages
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}




Future navigateToCart(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
}