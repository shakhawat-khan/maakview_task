import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:maakview/offers/offer_class.dart';

class Offers extends StatefulWidget {
  const Offers({Key? key}) : super(key: key);

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  Future<AllOffers> getOffers() async {
    http.Response response;

    response =
        await http.get(Uri.parse('https://www.maakview.com/api/v1/all-offers'));
    //print(response.body);

    if (response.statusCode == 200) {
      //AllOffers allOffers = AllOffers.fromJson(jsonDecode(response.body));

      //print(allOffers.data[0].banner);

      return AllOffers.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load offers');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getOffers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Offers'),
        ),
        body: FutureBuilder<AllOffers>(
          future: getOffers(),
          builder: (context, snapshot) {
            final alloffer = snapshot.data;

            if (snapshot.hasData) {
              return buildOffer(alloffer!);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return Center(child: const CircularProgressIndicator());
          },
        ));
  }

  Widget buildOffer(AllOffers allOffers) => ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: allOffers.data.length,
      itemBuilder: (context, index) {
        final data = allOffers.data[index];

        return Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.network(data.banner),
            ],
          ),
        );
      });
}
