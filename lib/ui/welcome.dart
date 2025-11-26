import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/city.dart';
import '../models/constants.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    Constants constants = Constants();
    Size size = MediaQuery.of(context).size;
    List<City> cities = City.citiesList
        .where((city) => city.isDefault == false)
        .toList();
    List<City> selectedCities = City.getSelectedCities();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: constants.primaryColor,
        title: Center(child: Text("${selectedCities.length} selected")),
      ),
      body: ListView.builder(
        itemCount: cities.length,
        itemBuilder: (BuildContext context, index) {
          return Container(
            margin: const EdgeInsets.only(left: 10, top: 20, right: 10),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: size.height * 0.08,
            width: size.width,
            decoration: BoxDecoration(
              border: cities[index].isSelected == true
                  ? Border.all(color: constants.secondaryColor.withOpacity(.6),width: 2)
                  : Border.all(color: Colors.white),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: constants.primaryColor.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                )
              ]
            ),
            child: Row(
              children : [
                InkWell(
                  onTap: (){
                    setState(() {
                      cities[index].isSelected = !cities[index].isSelected;
                    });
                  },
                    child: Image.asset(cities[index].isSelected== true ? 'assets/checked.png' : 'assets/unchecked.png',width: 30,)),
                const SizedBox(width: 10,),
                Text(cities[index].city,style: TextStyle(
                  fontSize: 16,
                  color: cities[index].isSelected == true? constants.primaryColor : Colors.black,
                ),)
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(backgroundColor: constants.secondaryColor,onPressed: (){
        print(selectedCities.length);
      },child: Icon(Icons.pin_drop_outlined),),
    );
  }
}
