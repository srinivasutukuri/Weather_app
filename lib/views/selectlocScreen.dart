import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:texttheam/contant/colors.dart';
import 'package:texttheam/contant/images.dart';
import 'package:texttheam/custom/roundclipper.dart';
import 'package:texttheam/provider/apiprovider.dart';
import 'package:texttheam/views/homescreen.dart';

class LocselectorScreen extends StatelessWidget {
  const LocselectorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, provider, _) {
      return Scaffold(
        backgroundColor: AppColors.deepPurple,
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Weather",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                    color: AppColors.white,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: AppColors.deepPurple,
                        borderRadius: BorderRadius.circular(555),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.search,
                            color: AppColors.grey,
                            size: 20,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: provider.cityController,
                              decoration: const InputDecoration(
                                hintText: "Search city",
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: AppColors.white,
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                              ),
                              style: const TextStyle(
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    provider.fillCity(provider.city);
                    provider.getdata(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Homescreen(),
                        ));
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(555), color: AppColors.purple),
                    child: const Text(
                      "Show",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Stack(
                  children: [
                    ClipPath(
                      clipper: WeatherClipper(),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                        decoration: BoxDecoration(
                          color: AppColors.purple,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "19",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 60,
                                    color: AppColors.white,
                                  ),
                                ),
                                Text(
                                  "O",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    color: AppColors.white,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "H:18",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: AppColors.grey,
                                  ),
                                ),
                                Text(
                                  "O",
                                  style: TextStyle(
                                    fontSize: 7,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.grey,
                                  ),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "L:21",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: AppColors.grey,
                                  ),
                                ),
                                Text(
                                  "O",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 7,
                                    color: AppColors.grey,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Bengaluru, India",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: AppColors.white,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "Mid Rain",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10,
                                    color: AppColors.white,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const Positioned(
                        top: 0,
                        right: 20,
                        child: Image(
                          image: AssetImage(
                            clearsky,
                          ),
                          height: 100,
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
