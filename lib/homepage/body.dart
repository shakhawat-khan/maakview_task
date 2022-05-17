import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:maakview/brands/all_brands.dart';
import 'package:maakview/categories/all_categories.dart';
import 'package:maakview/homepage/flash_sale/flash_sale_card.dart';
import 'package:maakview/homepage/most_popular_item/most_popular_card.dart';
import 'package:maakview/homepage/popular_categories/popular_categories_card.dart';
import 'package:maakview/homepage/style.dart';

import '../offers/all_offers.dart';
import 'flash_sale/flash_sale_model.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  dynamic jsonData;

  Future<FlashSale> getFlashSaleData() async {
    http.Response response;
    response = await http.get(Uri.parse(
        'https://www.maakview.com/api/v1/setting/home/product_section_two'));

    if (response.statusCode == 200) {
      return jsonData = FlashSale.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('faild to load categories');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFlashSaleData();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Popular Categories',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
                ),
                RawMaterialButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Categories()));
                  },
                  child: Text(
                    'View All >',
                    style: TextStyle(color: Colors.deepPurpleAccent),
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                PopularCategoriesCard(
                    path: 'assets/svgg/categories/automobiles.svg'),
                PopularCategoriesCard(
                    path: 'assets/svgg/categories/fasion.svg'),
                PopularCategoriesCard(
                    path: "assets/svgg/categories/fitness.svg"),
                PopularCategoriesCard(
                    path: 'assets/svgg/categories/Health_ Beauty.svg'),
                PopularCategoriesCard(
                    path: 'assets/svgg/categories/Home_Appliances.svg'),
                PopularCategoriesCard(
                    path: 'assets/svgg/categories/monitors.svg'),
                PopularCategoriesCard(
                    path: 'assets/svgg/categories/Security.svg'),
                PopularCategoriesCard(
                    path: 'assets/svgg/categories/Smart _ Feature Phones.svg'),
                PopularCategoriesCard(
                    path: 'assets/svgg/categories/sports.svg'),
                PopularCategoriesCard(path: 'assets/svgg/categories/toys.svg'),
              ],
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(5.0),
            child: Text(
              'Most Popular',
              style: KlableTextStyle,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                MostPopularCard(
                  path: 'assets/mostpopular.jpg',
                  details: 'Base Model Core',
                  price: '৳230,000.00',
                  model: 'Razer Blade 15',
                ),
                MostPopularCard(
                    path: 'assets/monitor.jpg',
                    price: '৳9,500.00',
                    details: '18.5 inch LED Monitor',
                    model: 'Dell D1918H'),
                MostPopularCard(
                  path: 'assets/mostpopular.jpg',
                  details: 'Base Model Core',
                  price: '৳230,000.00',
                  model: 'Razer Blade 15',
                ),
                MostPopularCard(
                    path: 'assets/monitor.jpg',
                    price: '৳9,500.00',
                    details: '18.5 inch LED Monitor',
                    model: 'Dell D1918H'),
                MostPopularCard(
                  path: 'assets/mostpopular.jpg',
                  details: 'Base Model Core',
                  price: '৳230,000.00',
                  model: 'Razer Blade 15',
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          RawMaterialButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Offers()));
            },
            child: Text(
              'ALL OFFERS',
              style: TextStyle(color: Colors.deepPurpleAccent),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Image(
            image: AssetImage('assets/offers.gif'),
            fit: BoxFit.fill,
          ),
          SizedBox(
            height: 10,
          ),
          RawMaterialButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Brands()));
            },
            child: Text(
              'ALL Brands',
              style: TextStyle(color: Colors.deepPurpleAccent),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(5.0),
            child: Text(
              'Flash Sale',
              style: KlableTextStyle,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                FlashSaleCard(
                  path: 'assets/mostpopular.jpg',
                  model: 'Razer Blade 15',
                  price: '৳38,000.00',
                  details: 'Base Model Core',
                  discountPercent: '7',
                  discountPrice: '৳40,000.00',
                ),
                FlashSaleCard(
                  path: 'assets/monitor.jpg',
                  model: 'Dell D1918H',
                  price: '৳19,000.00',
                  details: 'LED Monitor',
                  discountPercent: '10',
                  discountPrice: '৳17,800.00',
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
