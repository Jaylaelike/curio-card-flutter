import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_curio/models/curiocard.dart';
import 'package:flutter/material.dart';

class CardDetailPage extends StatelessWidget {
  const CardDetailPage({Key? key, required CardType this.card})
      : super(key: key);
  final CardType card;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //Image
              Card(
                child: CachedNetworkImage(
                  fit: BoxFit.fitWidth,
                  imageUrl: "https://ipfs.io/ipfs/${card.ipfsHash}",
                  placeholder: (context, url) => SizedBox(
                    width: 32,
                    height: 32,
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              //name
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('${card.name} (${card.symbol})'),
              ),

              //descriptions
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(card.description),
              ),

              //address
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(card.address),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
