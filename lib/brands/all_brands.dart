import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'brand_class.dart';

class Brands extends StatefulWidget {
  const Brands({Key? key}) : super(key: key);

  @override
  State<Brands> createState() => _AllBrandsState();
}

class _AllBrandsState extends State<Brands> {
  Future<AllBrands> getBrand() async {
    http.Response response;
    response =
        await http.get(Uri.parse('https://www.maakview.com/api/v1/all-brands'));
    if (response.statusCode == 200) {
      return AllBrands.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load brands');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Brands'),
      ),
      body: FutureBuilder<AllBrands>(
        future: getBrand(),
        builder: (context, snapshot) {
          final allbrands = snapshot.data;

          if (snapshot.hasData) {
            return buildBrand(allbrands!);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return Center(child: const CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildBrand(AllBrands allBrands) => ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: allBrands.data.length,
      itemBuilder: (context, index) {
        // final data_len = allBrands.data[index];

        return Padding(
          padding: EdgeInsets.all(8.0),
          child: Wrap(
            direction: Axis.vertical,
            children: [
              Image.network(allBrands.data[index].logo),
            ],
          ),
        );
      });
}
