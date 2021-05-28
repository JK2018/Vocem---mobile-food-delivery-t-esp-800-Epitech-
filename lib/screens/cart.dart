import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vocem/custom_widgets/cart_item.dart';
import 'package:vocem/routes/pagination.dart';
import '../global_vars.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: c4,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 45.0,),
            Text("Panier",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 21.0,
            ),),
            SizedBox(height: 18.0,),
            CartItem(imgUrl: "https://cdn.pixabay.com/photo/2020/10/05/19/55/hamburger-5630646_1280.jpg",),
            CartItem(imgUrl: "https://cdn.pixabay.com/photo/2015/05/22/16/00/french-fries-779292_1280.jpg",),
            CartItem(imgUrl: "https://cdn.pixabay.com/photo/2021/04/23/06/35/soda-6200841_1280.jpg",),
            SizedBox(height: 25.0,),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),),
                Text("€ 50,00",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Frais de livraison",
                  style: TextStyle(
                    fontSize: 14.0,
                  ),),
                Text("€ 3,50",
                  style: TextStyle(
                    fontSize: 14.0,
                  ),)
              ],
            ),
            SizedBox(height: 15.0,),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total TTC",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),),
                Text("€ 53,50",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),)
              ],
            ),
            Spacer(),
            MaterialButton(onPressed: (){},
              height: 50.0,
              minWidth: double.infinity,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: c2,
              child: Text("Payer la commande",
              style: TextStyle(
                color: c4,
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),),),
            SizedBox(height: 18.0,),

            //Pagination(),
          ],
      ),
      ),
    );
  }


}





