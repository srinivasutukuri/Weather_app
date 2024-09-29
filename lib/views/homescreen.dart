import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:texttheam/contant/hleperfunctions.dart';
import 'package:texttheam/custom/hearder.dart';
import 'package:texttheam/custom/progressbar.dart';
import 'package:texttheam/custom/roundclipper.dart';
import 'package:texttheam/contant/colors.dart';
import 'package:texttheam/contant/images.dart';
import 'package:texttheam/custom/windpainter.dart';
import 'package:texttheam/model/wheathermodel.dart';
import 'package:texttheam/provider/apiprovider.dart';
import 'package:texttheam/views/compondwidgets/wethercard.dart';
import 'package:texttheam/views/selectlocScreen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  // City Selection on First Launch
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((e) {
      context.read<HomeProvider>().checkCity(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, _) {
        WeatherModel? wheaterdetails = provider.details;

        if (wheaterdetails == null) {
          // loding
          return Scaffold(
              body: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xFF2D3156),
                        Color(0xFF2D3156),
                        Color(0xFF492D81),
                        Color(0xFF3C3D5A),
                      ],
                    ),
                  ),
                  child: const Center(child: CircularProgressIndicator())));
        } else {
          List<Forecastday> forecastday = wheaterdetails.forecast.forecastday;
          List<Hour> hours = wheaterdetails.forecast.forecastday[0].hour;

          return Scaffold(
            body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    toolbarHeight: 100,
                    backgroundColor: AppColors.deepPurple,
                    floating: true,
                    expandedHeight: 500,
                    pinned: true,
                    flexibleSpace: LayoutBuilder(
                      // tilte animation
                      builder: (BuildContext context, BoxConstraints constraints) {
                        var top = constraints.biggest.height;
                        double opacity = ((500 - top) / (500 - 100)).clamp(0.0, 1.0);
                        return ClipPath(
                          clipper: CornerClipper(), // bottom curve shape ,
                          child: FlexibleSpaceBar(
                            centerTitle: true,
                            title: Opacity(
                              opacity: opacity,
                              child: Column(
                                children: [
                                  const Spacer(),
                                  Text(
                                    wheaterdetails.location.name,
                                    style: const TextStyle(
                                      fontSize: 25,
                                      color: AppColors.white,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        wheaterdetails.current.tempC.toInt().toString(),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20,
                                          color: AppColors.lightGrey,
                                        ),
                                      ),
                                      const Text(
                                        "O",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.lightGrey,
                                        ),
                                      ),
                                      const Text(
                                        " | ",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.lightGrey,
                                        ),
                                      ),
                                      Text(
                                        wheaterdetails.current.condition.text,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.lightGrey,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            // displaying tempature as background
                            background: Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.asset(
                                    backgroungimage,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const Positioned(
                                  bottom: -150,
                                  left: 24,
                                  child: Image(
                                    height: 350,
                                    image: AssetImage(house),
                                  ),
                                ),
                                Positioned(
                                  left: 120,
                                  bottom: 200,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        wheaterdetails.location.name,
                                        style: const TextStyle(
                                          fontSize: 34,
                                          color: AppColors.white,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            wheaterdetails.current.tempC.toInt().toString(),
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 90,
                                              color: AppColors.white,
                                            ),
                                          ),
                                          const Text(
                                            "O",
                                            style: TextStyle(
                                              fontSize: 30,
                                              color: AppColors.white,
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width: 120,
                                        child: Text(
                                          wheaterdetails.current.condition.text,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20,
                                            color: AppColors.lightGrey,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "H:${wheaterdetails.location.lat}",
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 20,
                                                  color: AppColors.white,
                                                ),
                                              ),
                                              const Text(
                                                "O",
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.white,
                                                ),
                                              ),
                                              const SizedBox(width: 5),
                                              Text(
                                                "L:${wheaterdetails.location.lon}",
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 20,
                                                  color: AppColors.white,
                                                ),
                                              ),
                                              const Text(
                                                "O",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 10,
                                                  color: AppColors.white,
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: 50,
                                  right: 20,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const LocselectorScreen(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(15),
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.deepPurple,
                                      ),
                                      child: const Icon(
                                        Icons.add,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ];
              },
              // diaplay weather deltails like aqi, and forecast
              body: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xFF2D3156),
                      Color(0xFF2D3156),
                      Color(0xFF492D81),
                      Color(0xFF3C3D5A),
                    ],
                  ),
                ),
                // Daily forecast
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      const Heardertext(title: "Daily forecast"),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 160,
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemCount: wheaterdetails.forecast.forecastday.length,
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(width: 20);
                          },
                          itemBuilder: (BuildContext context, int index) {
                            return Wheatercard(
                              time: convertStringToDate(
                                forecastday[index].date.toString(),
                              ),
                              imageurl: "https:${forecastday[index].day.condition.icon}",
                              tempC: "${forecastday[index].day.maxtempC.toInt()}\n${forecastday[index].day.mintempC.toInt()}",
                            );
                          },
                        ),
                      ),
                      //"hourly forecast"
                      const SizedBox(height: 20),
                      const Heardertext(title: "hourly forecast"),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 140,
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemCount: wheaterdetails.forecast.forecastday[0].hour.length,
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(width: 10);
                          },
                          itemBuilder: (BuildContext context, int index) {
                            return Wheatercard(
                              time: formatTimeFromString(hours[index].time),
                              imageurl: "https:${hours[index].condition.icon}",
                              tempC: hours[index].tempC.toInt().toString(),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 30),
                      // aiq indicator
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.purple.withOpacity(0.8)),
                            borderRadius: const BorderRadius.all(Radius.circular(20)),
                            color: AppColors.deepPurple),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Heardertext(title: "AIR QUALITY"),
                            const SizedBox(height: 10),
                            Text(
                              provider.aqi?.overallAqi.toString() ?? "0.0",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: AppColors.white,
                              ),
                            ),
                            Text(
                              getAQIImpact(provider.aqi?.overallAqi ?? 0),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: AppColors.white,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Cprogressbar(
                              currentIndex: provider.aqi?.overallAqi.toDouble() ?? 0.0,
                              maxIndex: 500,
                            ),
                          ],
                        ),
                      ),
                      //  additional  weather deatails in gridview
                      GridView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                        children: <Widget>[
                          // Uv indicator
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColors.purple.withOpacity(0.8)),
                                borderRadius: const BorderRadius.all(Radius.circular(20)),
                                color: Colors.transparent),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Heardertext(
                                  title: "UV INDEX",
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  wheaterdetails.current.uv.toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    color: AppColors.white,
                                  ),
                                ),
                                Text(
                                  getUVIndexImpact(wheaterdetails.current.uv),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    color: AppColors.white,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Cprogressbar(
                                  currentIndex: wheaterdetails.current.uv <= 11 ? wheaterdetails.current.uv : 11,
                                  maxIndex: 11,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColors.purple.withOpacity(0.8)),
                                borderRadius: const BorderRadius.all(Radius.circular(20)),
                                color: Colors.transparent),
                            child: Column(
                              children: [
                                const Heardertext(title: "Wind"),
                                SizedBox(
                                  width: 120,
                                  height: 120,
                                  child: CustomPaint(
                                    painter: WindPainter(),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
