import 'package:cryptodemo/screens/first_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(title: Text('ABOUT'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 100,
                height: 100,
                child: SvgPicture.asset('assets/icons/dollar.svg')),
            SizedBox(height: 10,),
            Text("DESIGN BY MINH"),
          ],
        )
      ),

    );
  }
}
