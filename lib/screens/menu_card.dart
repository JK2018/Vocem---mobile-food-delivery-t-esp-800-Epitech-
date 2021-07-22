import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      margin: EdgeInsets.only(top: 5, bottom: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.white12,
            blurRadius: 40,
            offset: Offset(0, 5), // Shadow position
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 1,
            child: Column(
              children: [
                Text('Title', textAlign: TextAlign.start,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),),
                SizedBox(height: 10,),
                Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has beens',
                  style: TextStyle(fontSize: 13,),),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(15.0),
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.deepPurple[300])
                      ),
                      child: Text('20 €',
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold,),),
                    ),
                    TextButton(
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),
                        onPressed: ()=>print("Want to buy"),
                        child: Text("Buy", style: TextStyle(color: Colors.white),)),
                  ],
                )
              ],
            ),
          ),
          Flexible(
              flex: 1,
              child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdfCJ2nV3VtZ0UpGophvobv2q4Nlha3aNDeP36ivV5pxvIJim9SQBBN8lRxe7nUSOjcxQ&usqp=CAU"))
        ],
      ),
    );
  }
}
