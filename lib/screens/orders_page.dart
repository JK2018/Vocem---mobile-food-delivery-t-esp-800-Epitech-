import 'package:flutter/material.dart';

class OrdersPage extends StatefulWidget {
  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vos commandes",style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          ListTile(
              title: Text("Tacos Street"),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("09-06-2000"),
                  Text("12 €"),
                ],
              ),
              leading: CircleAvatar(backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpaOK42g19G1-NoeVLpB-hovEWVcXzhVbYgQ&usqp=CAU",),),
              //trailing: Icon(Icons.arrow_right),
          ),
          Divider(),
          ListTile(
            title: Text("Tacos Street"),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("09-06-2000"),
                Text("12 €"),
              ],
            ),
            leading: CircleAvatar(backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpaOK42g19G1-NoeVLpB-hovEWVcXzhVbYgQ&usqp=CAU",),),
            //trailing: Icon(Icons.arrow_right),
          ),
        ],
      ),
    );
  }
}
