import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:zlp_jokes/features/joke_screen/widgets/joke_card.dart';

const Map<String, dynamic> json = {
  'id': 1,
  'text': 'Появился корейский компьютерный вирус. Он съедает "@" из почтовых адресов"',
  'annottations': {
    '1': 'аннотация',
    '2': 'аннотация 2',
  },
};

const Map<String, dynamic> json2 = {
  'id': 1,
  'text':
      'Два друга стоят в очереди. Один рассказывает анекдот: - Что делать, если у эпилептика начался приступ в ванне? Не знаешь? Ха! Нужно бросить в воду грязное бельё и добавить стирального порошка!  Посмеялись. Тут к ним поворачивается стоящий в очереди мужчина и укоризненно говорит: - Как вам не стыдно! У меня так племянник погиб... Носком подавился...',
  'annottations': {
    '1': 'аннотация',
    '2': 'аннотация 2',
  },
};

const Map<String, dynamic> json3 = {
  'id': 1,
  'text':
      'Едут как-то мужики в поезде. Проезжают поле, а на нём коровы пасутся. Один из мужиков восклицает: —О, на этом поле 343 коровы! Никто не обращает на это внимания, едут дальше. Проезжают ещё одно поле с коровами. —А здесь 427 коров! Снова никто не обращает внимания, едут дальше. И вот, в третий раз проезжают поле с коровами. Мужик снова: А здесь 634! Все в поезде не выдерживают, идут к машинисту, останавливают поезд, выходят, идут пересчитывать всех коров. Мужик оказался прав, коров действительно было 634. Все в недоумении, подходят к мужику и спрашивают: —Но как ты смог угадать —Очень просто, считаю ноги, и делю на четыре.',
  'annottations': {
    '1': 'аннотация',
    '2': 'аннотация 2',
  },
};

class GridScreen extends StatefulWidget {
  const GridScreen({super.key});

  @override
  State<GridScreen> createState() => _GridScreenState();
}

class _GridScreenState extends State<GridScreen> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = constraints.maxWidth < 800 ? 1 : 2;
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Flexible(
                    flex: 1,
                    child: SizedBox.shrink(),
                  ),
                  Flexible(
                    flex: 6,
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
                          crossAxisCount: crossAxisCount,
                          crossAxisSpacing: 36,
                          mainAxisSpacing: 36,
                          children: const [
                            JokeCard(
                              joke: json,
                              isJokePage: false,
                            ),
                            JokeCard(
                              joke: json2,
                              isJokePage: false,
                            ),
                            JokeCard(
                              joke: json3,
                              isJokePage: false,
                            ),
                            JokeCard(
                              joke: json,
                              isJokePage: false,
                            ),
                            JokeCard(
                              joke: json2,
                              isJokePage: false,
                            ),
                            JokeCard(
                              joke: json3,
                              isJokePage: false,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
