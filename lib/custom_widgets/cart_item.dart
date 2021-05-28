import 'package:flutter/material.dart';

import '../global_vars.dart';

class CartItem extends StatelessWidget {
  final String imgUrl;
  final String description;
  final int price;
  final int quantity;

  const CartItem({
    Key key, @required this.imgUrl, this.description, this.price, this.quantity,
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