import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zlp_jokes/features/grid_screen/models/joke_model.dart';
import 'package:zlp_jokes/utils/app_colors.dart';

class JokeCard extends StatefulWidget {
  final Map<String, dynamic> joke;

  const JokeCard({super.key, required this.joke});

  @override
  State<JokeCard> createState() => _JokeCardState();
}

class _JokeCardState extends State<JokeCard> {
  late JokeModel jokeModel;

  @override
  void initState() {
    jokeModel = JokeModel.fromJson(widget.joke);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.color200,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: AppColors.color900,
          width: 2,
          style: BorderStyle.solid,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.color800,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: AppColors.color800,
                      width: 2,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
                    child: Text(
                      '1.00',
                      style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/joke', arguments: jokeModel);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Text(jokeModel.text),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.share,
                    color: AppColors.color900,
                    size: 28,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    await Clipboard.setData(ClipboardData(text: jokeModel.text));
                  },
                  icon: const Icon(
                    Icons.copy,
                    color: AppColors.color900,
                    size: 28,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
