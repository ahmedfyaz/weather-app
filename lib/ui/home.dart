import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:untitled1/components/weather_item.dart';
import 'package:untitled1/controllers/home_controller.dart';
import 'package:untitled1/ui/detail_page.dart';
import '../models/constants.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    Size size = MediaQuery.of(context).size;
    final controller = Get.put(HomeController());
    final constants = Constants();
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<HomeController>(
          builder: (logic) {
            return Container(
              width: size.width,
              height: size.height,
              padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
              color: constants.primaryColor.withAlpha(25),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            gradient: constants.linearGradientBlue,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: constants.primaryColor.withAlpha(51),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ]),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "assets/pin.png",
                                        width: 20,
                                      ),
                                      const SizedBox(width: 4),
                                      Flexible(
                                        child: Text(
                                          logic.location,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          controller.cityController.clear();
                                          showMaterialModalBottomSheet(
                                              context: context,
                                              builder: (context) =>
                                                  SingleChildScrollView(
                                                    controller:
                                                        ModalScrollController.of(
                                                            context),
                                                    child: Container(
                                                      height: size.height * .2,
                                                      padding:
                                                          const EdgeInsets.symmetric(
                                                        horizontal: 20,
                                                        vertical: 10,
                                                      ),
                                                      child: Column(
                                                        children: [
                                                          SizedBox(
                                                            width: 70,
                                                            child: Divider(
                                                              thickness: 3.5,
                                                              color: constants
                                                                  .primaryColor,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          TextField(
                                                            onChanged:
                                                                (searchText) {
                                                              controller
                                                                  .fetchWeatherData(
                                                                      searchText);
                                                            },
                                                            controller:
                                                                controller
                                                                    .cityController,
                                                            autofocus: true,
                                                            decoration:
                                                                InputDecoration(
                                                                    prefixIcon:
                                                                        Icon(
                                                                      Icons.search,
                                                                      color: constants
                                                                          .primaryColor,
                                                                    ),
                                                                    suffixIcon:
                                                                        GestureDetector(
                                                                      onTap: () =>
                                                                          controller
                                                                              .cityController
                                                                              .clear(),
                                                                      child: Icon(
                                                                        Icons.clear,
                                                                        color: constants
                                                                            .primaryColor,
                                                                      ),
                                                                    ),
                                                                    hintText:
                                                                        'Search city e.g. Islamabad',
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: constants
                                                                            .primaryColor,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                    )),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ));
                                        },
                                        icon: const Icon(
                                          Icons.keyboard_arrow_down,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    "assets/profile.jpeg",
                                    width: 40,
                                    height: 40,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 160,
                              child: Image.asset("assets/${logic.weatherIcon}"),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    logic.temperature.toString(),
                                    style: TextStyle(
                                      fontSize: 80,
                                      fontWeight: FontWeight.bold,
                                      foreground: Paint()
                                        ..shader = constants.shader,
                                    ),
                                  ),
                                ),
                                Text(
                                  'o',
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    foreground: Paint()
                                      ..shader = constants.shader,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              logic.currentWeatherStatus,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 20.0,
                              ),
                            ),
                            Text(
                              logic.currentDate,
                              style: const TextStyle(
                                color: Colors.white70,
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: const Divider(
                                color: Colors.white70,
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  WeatherItem(
                                    value: logic.windSpeed.toInt(),
                                    unit: 'km/h',
                                    imageUrl: 'assets/windspeed.png',
                                  ),
                                  WeatherItem(
                                    value: logic.humidity.toInt(),
                                    unit: '%',
                                    imageUrl: 'assets/humidity.png',
                                  ),
                                  WeatherItem(
                                    value: logic.cloud.toInt(),
                                    unit: '%',
                                    imageUrl: 'assets/cloud.png',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Today',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                              GestureDetector(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => DetailPage(
                                              dailyForecastWeather:
                                                  logic.dailyWeatherForecast,
                                            ))), //this will open forecast screen
                                child: Text(
                                  'Forecasts',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: constants.primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            height: 110,
                            child: ListView.builder(
                              itemCount: logic.hourlyWeatherForecast.length,
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                String currentTime = DateFormat('HH:mm:ss')
                                    .format(DateTime.now());
                                String currentHour = currentTime.substring(0, 2);

                                String forecastTime = logic
                                    .hourlyWeatherForecast[index]["time"]
                                    .substring(11, 16);
                                String forecastHour = logic
                                    .hourlyWeatherForecast[index]["time"]
                                    .substring(11, 13);

                                String forecastWeatherName = logic
                                        .hourlyWeatherForecast[index]
                                    ["condition"]["text"];
                                String forecastWeatherIcon = logic
                                    .getWeatherIcon(forecastWeatherName);

                                String forecastTemperature = logic
                                    .hourlyWeatherForecast[index]["temp_c"]
                                    .round()
                                    .toString();
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15),
                                  margin: const EdgeInsets.only(right: 20),
                                  width: 65,
                                  decoration: BoxDecoration(
                                      color: currentHour == forecastHour
                                          ? Colors.white
                                          : constants.primaryColor,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(50)),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: const Offset(0, 1),
                                          blurRadius: 5,
                                          color: constants.primaryColor
                                              .withAlpha(51),
                                        ),
                                      ]),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        forecastTime,
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: constants.greyColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Image.asset(
                                        'assets/$forecastWeatherIcon',
                                        width: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            forecastTemperature,
                                            style: TextStyle(
                                              color: constants.greyColor,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            'o',
                                            style: TextStyle(
                                              color: constants.greyColor,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 17,
                                              fontFeatures: const [
                                                FontFeature.enable('sups'),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}