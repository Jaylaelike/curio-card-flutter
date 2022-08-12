import 'dart:convert';
import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_curio/models/curiocard.dart';
import 'package:card_curio/services/query.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'card_detail.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Curio Card"),
      ),
      body: Query(
          options: QueryOptions(
            document: gql(getAllCards),
          ),
          builder: (result, {fetchMore, refetch}) {
            // has error
            if (result.hasException) {
              return Text("Error!!!");
            }

            // is Loadinng
            if (result.isLoading) {
              return Text("Loading...");
            }

            // is Empty
            if (result.data == null) {
              return Text("Data is Empty");
            }

            //Show data
            final data = result.data;
            final jsonString = json.encode(data);
            final CurioCard = curioCardFromJson(jsonString);
            //Logger().d(CurioCard.cardTypes.first.name);

            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: CurioCard.cardTypes.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: InkWell(
                    onTap: () {
                      //gotoCardDetail
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CardDetailPage(card: CurioCard.cardTypes[index]),
                        ),
                      );
                    },
                    child: CachedNetworkImage(
                      fit: BoxFit.fitWidth,
                      imageUrl:
                          "https://ipfs.io/ipfs/${CurioCard.cardTypes[index].ipfsHash}",
                      placeholder: (context, url) => SizedBox(
                        width: 32,
                        height: 32,
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
