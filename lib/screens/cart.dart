import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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





class CartItem extends StatelessWidget {
  final String imgUrl;
  const CartItem({
    Key key, @required this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: c4,
      margin: EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Container(
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
              color: c3,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Center(
              child: Container(
                width: 68.0,
                height: 68.0,
                decoration: BoxDecoration(
                  color: c1,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(imgUrl),
                  ),
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
            ),
          ),
          SizedBox(width: 12.0,),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100.0,
                child: Text("Big ass BURGER",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),),
              ),
              SizedBox(width: 8.0,),
              Row(
                children: [
                  Container(
                    width: 20.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                      color: c2,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Icon(
                      Icons.add,
                      color: c4,
                      size: 20.0,
                    ),
                  ),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text("1",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),),),
                  Container(
                    width: 20.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                      color: c2,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Icon(
                      Icons.remove,
                      color: c4,
                      size: 18.0,
                    ),
                  ),
                  Spacer(),
                  Text("€ 12,00",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),),
                ],
              )

            ],
          )
          ),

        ],
      ),
    );
  }
}
