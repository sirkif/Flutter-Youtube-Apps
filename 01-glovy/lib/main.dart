import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Glovy
              const SizedBox(
                height: 80,
              ),
              Container(
                width: 160,
                height: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.orange[300],
                    borderRadius: BorderRadius.circular(8)),
                child: Text(
                  "Glovy",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    color: Colors.green[600],
                  ),
                ),
              ),

              const SizedBox(
                height: 60,
              ),
              // Search Field
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: const BoxDecoration(
                  color: Color(0xffF2F3F2),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Search store ...")
                  ],
                ),
              ),

              const SizedBox(
                height: 60,
              ),

              // Glovy Products
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 170,
                    height: 170,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(83, 177, 117, 0.10),
                      border: Border.all(
                        color: const Color.fromRGBO(83, 117, 117, 0.7),
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('images/image_1.png'),
                        const Text("Fruits & Vegetables"),
                      ],
                    ),
                  ),
                  Container(
                    width: 170,
                    height: 170,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(248, 164, 76, 0.10),
                      border: Border.all(
                        color: const Color.fromRGBO(248, 164, 76, 0.70),
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('images/image_2.png'),
                        const Text("Cooking Oil"),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 170,
                    height: 170,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(247, 165, 147, 0.1),
                      border: Border.all(
                        color: const Color.fromRGBO(247, 165, 1477, 0.7),
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('images/image_3.png'),
                        const Text("Meat & Fish"),
                      ],
                    ),
                  ),
                  Container(
                    width: 170,
                    height: 170,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(211, 176, 224, 0.10),
                      border: Border.all(
                        color: const Color.fromRGBO(211, 176, 2246, 0.70),
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('images/image_4.png'),
                        const Text("Croissant & Bread"),
                      ],
                    ),
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
