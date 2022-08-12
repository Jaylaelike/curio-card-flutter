
import 'dart:convert';

CurioCard curioCardFromJson(String str) => CurioCard.fromJson(json.decode(str));

String curioCardToJson(CurioCard data) => json.encode(data.toJson());

class CurioCard {
    CurioCard({
        required this.typename,
        required this.cardTypes,
    });

    String typename;
    List<CardType> cardTypes;

    factory CurioCard.fromJson(Map<String, dynamic> json) => CurioCard(
        typename: json["__typename"],
        cardTypes: List<CardType>.from(json["cardTypes"].map((x) => CardType.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "__typename": typename,
        "cardTypes": List<dynamic>.from(cardTypes.map((x) => x.toJson())),
    };
}

class CardType {
    CardType({
        required this.typename,
        required this.id,
        required this.name,
        required this.description,
        required this.address,
        required this.supply,
        required this.symbol,
        required this.ipfsHash,
    });

    String typename;
    String id;
    String name;
    String description;
    String address;
    String supply;
    String symbol;
    String ipfsHash;

    factory CardType.fromJson(Map<String, dynamic> json) => CardType(
        typename: json["__typename"],
        id: json["id"],
        name: json["name"],
        description: json["description"],
        address: json["address"],
        supply: json["supply"],
        symbol: json["symbol"],
        ipfsHash: json["ipfsHash"],
    );

    Map<String, dynamic> toJson() => {
        "__typename": typename,
        "id": id,
        "name": name,
        "description": description,
        "address": address,
        "supply": supply,
        "symbol": symbol,
        "ipfsHash": ipfsHash,
    };
}


