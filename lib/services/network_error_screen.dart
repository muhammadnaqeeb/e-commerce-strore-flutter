import 'package:flutter/material.dart';

class NetworkErrorScreen extends StatelessWidget {
  const NetworkErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Network Error')),
    );
  }
}
