import 'package:flutter/material.dart';

class RCDivider extends StatelessWidget {
  const RCDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Row Column",
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/wallpaper.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    color: Colors.red,
                    padding: const EdgeInsets.all(5),
                    child: const Text("Hello"),
                  ),
                  Container(
                    color: Colors.green,
                    padding: const EdgeInsets.all(10),
                    child: const Text("Hello"),
                  ),
                  Container(
                    color: Colors.blue,
                    padding: const EdgeInsets.all(15),
                    child: const Text("Hello"),
                  ),
                ],
              ),
              VerticalDivider(
                color: Colors.red,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.red,
                    padding: const EdgeInsets.all(5),
                    child: const Text("Hello"),
                  ),
                  Container(
                    color: Colors.green,
                    padding: const EdgeInsets.all(10),
                    child: const Text("Hello"),
                  ),
                  Container(
                    color: Colors.blue,
                    padding: const EdgeInsets.all(15),
                    child: const Text("Hello"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
