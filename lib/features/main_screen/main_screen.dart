import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:zlp_jokes/features/main_screen/widgets/joke_card.dart';

const String txt = 'Lorem [ipsum dolor(хуйхуйхуй)] sit amet, consectetur [adipiscing(пенис123)] elit';

const Map<String, dynamic> json = {
  'text': 'Lorem [ipsum dolor(1)] sit amet, consectetur [adipiscing(2)] elit',
  'annottations': {
    '1': 'аннотация',
    '2': 'аннотация 2',
  },
};

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 200, right: 200, top: 100),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 8, bottom: 4),
                    child: Text(
                      'Все анекдоты',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 28,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                      thickness: 2,
                      height: 2,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 36),
              StaggeredGrid.count(
                crossAxisCount: 2,
                crossAxisSpacing: 36,
                mainAxisSpacing: 36,
                children: const [
                  JokeCard(
                    joke: json,
                  ),
                  // JokeCard(
                  //   joke: json2,
                  // ),
                  // JokeCard(
                  //   joke: json3,
                  // ),
                  // JokeCard(
                  //   joke: json,
                  // ),
                  // JokeCard(
                  //   joke: json2,
                  // ),
                  // JokeCard(
                  //   joke: json3,
                  // ),
                  // JokeCard(
                  //   joke: json,
                  // ),
                  // JokeCard(
                  //   joke: json2,
                  // ),
                  // JokeCard(
                  //   joke: json3,
                  // ),
                  // JokeCard(
                  //   joke: json,
                  // ),
                  // JokeCard(
                  //   joke: json2,
                  // ),
                  // JokeCard(
                  //   joke: json3,
                  // ),
                  // JokeCard(
                  //   joke: json,
                  // ),
                  // JokeCard(
                  //   joke: json2,
                  // ),
                  // JokeCard(
                  //   joke: json3,
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
