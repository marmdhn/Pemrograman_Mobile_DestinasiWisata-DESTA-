import 'package:flutter/material.dart';
import 'package:tubes_1/model/place_model.dart';
import 'package:tubes_1/screens/detailscreen/detail_screen.dart';
import 'package:tubes_1/screens/home/widgets/recommended_card.dart';
import 'package:tubes_1/utilities/colors.dart';

import 'widgets/category_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteClr,
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "assets/icons/home.png",
                height: 30,
                width: 30,
                color: kPrimaryClr,
              ),
              Image.asset(
                "assets/icons/calendar.png",
                height: 30,
                width: 30,
                color: Colors.grey,
              ),
              Image.asset(
                "assets/icons/bookmark.png",
                height: 30,
                width: 30,
                color: Colors.grey,
              ),
              Image.asset(
                "assets/icons/chat.png",
                height: 30,
                width: 30,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: SingleChildScrollView(
            child: Column(children: [
              //app bar
              Row(
                children: [
                  const CircleAvatar(
                    radius: 27,
                    backgroundImage: AssetImage("assets/images/profil.jpg"),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  RichText(
                      text: const TextSpan(
                          text: "Hello",
                          style: TextStyle(color: kBlackClr, fontSize: 18),
                          children: [
                        TextSpan(
                            text: ", Hisoka",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ))
                      ]))
                ],
              ),

              //search section
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Explore new destinastions",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Material(
                borderRadius: BorderRadius.circular(100),
                elevation: 5,
                child: Container(
                  decoration: BoxDecoration(
                      color: kWhiteClr,
                      borderRadius: BorderRadius.circular(100)),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                                hintText: "Search your destination",
                                prefixIcon: Icon(Icons.search),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none),
                          ),
                        ),
                        const CircleAvatar(
                          radius: 22,
                          backgroundColor: kPrimaryClr,
                          child:
                              Icon(Icons.sort_by_alpha_sharp, color: kWhiteClr),
                        )
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),
              Row(
                children: const [
                  Text(
                    "Location's",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              //category
              Container(
                height: 90,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Row(
                      children: [
                        CategoryCard(
                          press: () {},
                          image: "assets/images/mountains.jpeg",
                          title: "Trowulan",
                        ),
                        CategoryCard(
                          press: () {},
                          image: "assets/images/forests.jpeg",
                          title: "Pacet",
                        ),
                        CategoryCard(
                          press: () {},
                          image: "assets/images/sea.webp",
                          title: "Terawas",
                        ),
                        CategoryCard(
                          press: () {},
                          image: "assets/images/deserts.jpeg",
                          title: "Ngoro",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //Recomended
              const SizedBox(
                height: 20,
              ),
              Row(
                children: const [
                  Text(
                    "Recomended",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 300,
                child: ListView.builder(
                    itemCount: places.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 5, right: 15),
                        child: Row(
                          children: [
                            RecommendedCard(
                              placeInfo: places[index],
                              press: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DetailScreen(placeInfo: places[index]),
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                      );
                    }),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
