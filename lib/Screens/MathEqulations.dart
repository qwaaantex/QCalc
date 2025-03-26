import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class MathEqulation extends StatefulWidget {
  const MathEqulation({super.key});

  @override
  State<MathEqulation> createState() => _MathEqulationState();
}

class _MathEqulationState extends State<MathEqulation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,

        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            HugeIcons.strokeRoundedArrowLeft01,
            color: Theme.of(context).iconTheme.color,
            size: 34,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,

            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  HugeIcons.strokeRoundedMath,
                  color: Theme.of(context).iconTheme.color,
                  size: 40,
                ),
                ListTile(
                  title: Text(
                    "Что это за страница?",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  subtitle: Text(
                    "Данная страница находится в разработке и не предусматривает работоспособность, так как ещё не готова",
                    style: Theme.of(context).textTheme.labelSmall,
                    softWrap: true,
                  ),
                ),
                ListTile(
                  title: Text(
                    "Тогда для чего же она нужна?",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  subtitle: Text(
                    "После предыдущего вопроса вы наверно задаётесь этим вопросом"
                    " на что я отвечу! Многие наверно думают, что если выпускаешь какое-то приложение, то оно обязательно должно быть полностью готово."
                    " Но это не так, я решил сохранять интригу до последнего! Приложение готово, но думаю что всем будет интересно, что в ближайшем будущем оно сможет выполнять помимо абсолютно всех математических операций еще и квадратные уравнения и решение задач."
                    " С этой целью эта страница и была создана, для этого она и нужна. Поэтому запаситесь терпением и ждите глобального обновления, которое изменит ваше понимание к калькулятору",
                    style: Theme.of(context).textTheme.labelSmall,
                    softWrap: true,
                  ),
                ),
                ListTile(
                  title: Text(
                    "Чего стоит ожидать?",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  subtitle: Text(
                    '"Не чего", а "что" стоит ждать. Как и сказанно ранее, данная статья затрагивает темы только предстоящего обновления,'
                    " но сразу скажу. Что от приложения с калькулятор не стоит ждать чего большего, чем добавления решения задач и квадратных уравнений."
                    " Для многих и это покажется многим, но для меня нет, поэтому в предстоящем обновлении стоит ждать не только этих новвоведений, но и обновления интерфейса."
                    " Не исключается и добавление новых сервисов, по типу диаграмм и так далее. Поэтому ожидайте, что-то большое, всегда выполняется за длительный период",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
