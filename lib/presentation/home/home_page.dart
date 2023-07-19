import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather/presentation/home/home_controller.dart';
import 'package:weather/utils/fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController controller = Modular.get();
  Color backgroundColor = Colors.white;

  @override
  void initState() {
    super.initState();
    controller.getWeather();
    backgroundColor =
        controller.weatherForecast?.backgroundColor ?? Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);
    const BorderRadius border = BorderRadius.all(
      Radius.circular(20),
    );

    return Observer(builder: (context) {
      return Scaffold(
        backgroundColor:
            controller.weatherForecast?.backgroundColor ?? Colors.white,
        body: Stack(
          children: [
            SizedBox(
              height: screenSize.height,
              width: screenSize.width,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    ClipRRect(
                      borderRadius: border,
                      child: Container(
                        height: screenSize.height * .05,
                        width: screenSize.width * .9,
                        color: controller.weatherForecast?.backgroundColor,
                        child: Center(
                          child: Text(
                            'Weather App',
                            style: MyFontsStyles.title,
                          ),
                        ),
                      ),
                    ),
                    Observer(
                      builder: (context) {
                        if (controller.isLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (controller.weatherForecast == null) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return ClipRRect(
                          borderRadius: border,
                          child: SizedBox(
                            width: screenSize.width,
                            height: screenSize.height * .82,
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          width: screenSize.width * .9,
                                          child: Column(
                                            children: [
                                              Text(
                                                controller.weatherForecast?.city
                                                        .toUpperCase() ??
                                                    "",
                                                style: MyFontsStyles.title,
                                              ),
                                              Text(
                                                "${controller.weatherForecast?.temperatureForecastMinimum.format()}°/"
                                                "${controller.weatherForecast?.temperatureForecastMaximum.format()}°",
                                                style: MyFontsStyles
                                                    .homeScreenSubtitle,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Container(
                                          alignment: Alignment.topCenter,
                                          height: screenSize.height * .13,
                                          width: screenSize.width * .5,
                                          child: Column(
                                            children: [
                                              Center(
                                                child: Text(
                                                  "${controller.weatherForecast?.temperature.format()}°",
                                                  style: MyFontsStyles
                                                      .temperatureHomeScreen,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: screenSize.height * .13,
                                          width: screenSize.width * .4,
                                          child: Column(
                                            children: [
                                              Column(
                                                children: [
                                                  Text(
                                                    "Sensação Termica: ",
                                                    style: MyFontsStyles
                                                        .homeScreenSubtitle,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  Text(
                                                    "${controller.weatherForecast?.temperatureFeelsLike.format()}°",
                                                    style: MyFontsStyles
                                                        .homeScreenSubtitle,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    SizedBox(
                                      height: screenSize.height * .22,
                                      width: screenSize.width * .6,
                                      child: SizedBox(
                                        height: screenSize.height * .10,
                                        width: screenSize.width * .4,
                                        child: Image.network(
                                            controller.weatherForecast
                                                    ?.conditionIcon ??
                                                "",
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Container(
                                        height: screenSize.height * .33,
                                        width: screenSize.width * .8,
                                        color: Colors.white.withOpacity(.4),
                                        child: Padding(
                                          padding: const EdgeInsets.all(12),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: screenSize.height * .05,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Nascer do sol: ",
                                                      style: MyFontsStyles.text,
                                                    ),
                                                    Text(
                                                      controller
                                                          .weatherForecast!
                                                          .sunrise,
                                                      style: MyFontsStyles.text,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: screenSize.height * .05,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Por do sol: ",
                                                      style: MyFontsStyles.text,
                                                    ),
                                                    Text(
                                                      controller
                                                          .weatherForecast!
                                                          .sunset,
                                                      style: MyFontsStyles.text,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: screenSize.height * .05,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Fase da lua: ",
                                                      style: MyFontsStyles.text,
                                                    ),
                                                    Text(
                                                      controller
                                                          .weatherForecast!
                                                          .moonPhase,
                                                      style: MyFontsStyles.text,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: screenSize.height * .05,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Direção do vento: ",
                                                      style: MyFontsStyles.text,
                                                    ),
                                                    Text(
                                                      controller
                                                          .weatherForecast!
                                                          .windDirection,
                                                      style: MyFontsStyles.text,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: screenSize.height * .05,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Velocidade do vento: ",
                                                      style: MyFontsStyles.text,
                                                    ),
                                                    Text(
                                                      controller
                                                          .weatherForecast!
                                                          .windSpeed,
                                                      style: MyFontsStyles.text,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(0),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
            child: Container(
              color: Colors.lightBlueAccent,
              width: screenSize.width * .9,
              height: screenSize.height * .07,
              child: IconButton(
                onPressed: () {
                  controller.getWeather();
                },
                icon: const Icon(
                  Icons.refresh,
                  size: 40,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
