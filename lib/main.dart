import 'package:card_curio/pages/home.dart';
import 'package:card_curio/services/curio.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Curio Card',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: GraphQLProvider(
        client: CurioCardService.clientToQuery(),
        child: const HomePage(),
      ),
    );
  }
}