import 'package:flutter/material.dart';
import 'package:maakview/homepage/style.dart';

class MostPopularCard extends StatelessWidget {
  String path;
  String price;
  String details;
  String model;
  MostPopularCard(
      {required this.path,
      required this.price,
      required this.details,
      required this.model});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      child: Container(
        height: 280,
        width: 140,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image(
              image: AssetImage(path),
              fit: BoxFit.fill,
            ),
            Container(
              padding: EdgeInsets.only(left: 5.0),
              alignment: Alignment.topLeft,
              child: Text(
                price,
                style: KlablePrice,
              ),
            ),
            Container(
                padding: EdgeInsets.fromLTRB(5, 10, 0, 0),
                alignment: Alignment.topLeft,
                child: Text(
                  model,
                  style: KlableDetailsStyle,
                )),
            Container(
              padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
              alignment: Alignment.topLeft,
              child: Text(
                details,
                style: KlableDetailsStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 15, 0, 0),
              child: Row(
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 20,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Buy Now',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Icon(
                    Icons.favorite_border,
                    size: 20,
                    color: Colors.deepPurpleAccent,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}
