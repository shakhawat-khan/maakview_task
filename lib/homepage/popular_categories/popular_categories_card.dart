import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PopularCategoriesCard extends StatelessWidget {
  String path;

  PopularCategoriesCard({required this.path});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      child: Container(
        height: 200,
        width: 140,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              path,
              color: Colors.deepPurpleAccent,
              fit: BoxFit.scaleDown,
              height: 200,
              width: 100,
            ),
          ],
        ),
      ),
    );
  }
}
