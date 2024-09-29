import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:texttheam/provider/apiprovider.dart';

import 'package:texttheam/views/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Weather",
        theme: ThemeData(),
        home: const Homescreen(),
      ),
    );
  }
}


// ChangeNotifierProvider(
//       create: (_) => CountProvider(),
//       child: MaterialApp(
//         title: 'Flutter Demo',
//         home: CounterScrren(),
//       ),
//     );