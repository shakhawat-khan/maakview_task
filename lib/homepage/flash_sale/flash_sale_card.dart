import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maakview/homepage/style.dart';

class FlashSaleCard extends StatelessWidget {
  String discountPrice;
  String price;
  String model;
  String details;
  String discountPercent;
  String path;

  FlashSaleCard(
      {required this.discountPercent,
      required this.details,
      required this.model,
      required this.price,
      required this.discountPrice,
      required this.path});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      child: Container(
        //alignment: Alignment.topLeft,
        height: 150,
        width: 300,
        child: Row(
          children: [
            Container(
              height: 60,
              width: 20,
              color: Colors.red,
              child: Container(
                alignment: Alignment.center,
                child: RotatedBox(
                  quarterTurns: 3,
                  child: Text(
                    'OFF ${discountPercent} %',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Image(
              image: AssetImage(
                path,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              children: [
                Text(
                  discountPrice,
                  style: KlableDiscountPrice,
                ),
                Text(
                  price,
                  style: KlablePrice,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  model,
                  style: KlableDetailsStyle,
                ),
                Flexible(
                  child: Text(
                    details,
                    style: KlableDetailsStyle,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
