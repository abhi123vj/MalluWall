import 'package:flutter/material.dart';

class DowloadScreen extends StatelessWidget {
  const DowloadScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: 
      Column(
        children: [
          Expanded(child: Container(child: Text("Home"))),
          Expanded(child: Container(child: Text("Lock"))),
          Expanded(child: Container(child: Text("Both"))),
          
        ],
      ),
    );
  }
}