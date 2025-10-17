import 'package:flutter/material.dart';
import 'package:deeplinks/constants/app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBar(title: "creators..") ,
      body: 
       Center(
        child: Text("welcome to the home page"),
      ),
    );
  }
}