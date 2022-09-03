import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/providers/product_provider.dart';
import 'package:store/screens/home_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
    child: const MyApp(),
    create: (_) => ProductProvider(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Store',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ).copyWith(
        splashFactory: NoSplash.splashFactory,
      ),
      home: HomeScreen(),
    );
  }
}
