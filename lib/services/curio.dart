import 'package:card_curio/const.dart';
import 'package:flutter/material.dart';
import 'package:graphql/client.dart';

class CurioCardService {
  static String baseUrl =
      'https://gateway.thegraph.com/api/$API_KEY/subgraphs/id/JBnWrv9pvBvSi2pUZzba3VweGBTde6s44QvsDABP47Gt';

  static HttpLink httpLink = HttpLink(baseUrl);

  static ValueNotifier<GraphQLClient> clientToQuery() {
    return ValueNotifier(
      GraphQLClient(
        cache: GraphQLCache(
          store: InMemoryStore(),
        ),
        link: httpLink,
      ),
    );
  }
}