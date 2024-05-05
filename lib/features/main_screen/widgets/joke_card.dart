import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zlp_jokes/features/main_screen/models/joke_model.dart';
import 'package:zlp_jokes/utils/app_colors.dart';

class JokeCard extends StatefulWidget {
  final Map<String, dynamic> joke;
  const JokeCard({super.key, required this.joke});

  @override
  State<JokeCard> createState() => _JokeCardState();
}

class _JokeCardState extends State<JokeCard> {
  List<TextSpan> textSpans = [];

  final TextStyle annotationStyle = const TextStyle(
    color: Colors.black,
    fontSize: 20,
    backgroundColor: Color(0x261E1F24),
  );
  final TextStyle defaultStyle = const TextStyle(
    color: Colors.black,
    fontSize: 20,
  );

  late JokeModel jokeModel;

  @override
  void initState() {
    jokeModel = JokeModel.fromJson(widget.joke);
    spansGenerator(jokeModel);
    super.initState();
  }

  void spansGenerator(JokeModel jokeModel) {
    for (var element in jokeModel.jokeParts) {
      if (element.annotation == null) {
        textSpans.add(TextSpan(text: element.text, style: defaultStyle));
      } else {
        textSpans.add(
          TextSpan(
            text: element.text,
            style: annotationStyle,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      child: Text(element.annotation!),
                    );
                  },
                );
              },
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 200,
      child: Container(
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
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: SelectableText.rich(
                  TextSpan(children: textSpans),
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
                      await Clipboard.setData(ClipboardData(text: jokeModel.plainText));
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
      ),
    );
  }
}
