import 'package:flutter/material.dart';
import 'package:untitled1/ui/welcome.dart';

import '../models/constants.dart';
class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    Constants constants = Constants();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          color: constants.primaryColor.withOpacity(0.5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/get-started.png"),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Welcome()));
              },
              child: Container(
                height: 50,
                width: size.width * .7,
                decoration: BoxDecoration(
                  color: constants.secondaryColor,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Center(
                  child: Text("Get Started",style: TextStyle(color: Colors.white,fontSize: 18),),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
