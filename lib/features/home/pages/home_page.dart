import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils.dart';
import '../../../blocs/navbar/navbar_bloc.dart';
import '../../income/pages/income_page.dart';
import '../../news/pages/news_page.dart';
import '../../quiz/pages/quiz_page.dart';
import '../widgets/nav_bar.dart';
import 'main_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 62 + getBottom(context)),
            child: BlocBuilder<NavbarBloc, NavbarState>(
              builder: (context, state) {
                if (state is NavbarIncome) return const IncomePage();

                if (state is NavbarNews) return const NewsPage();

                if (state is NavbarQuiz) return const QuizPage();

                return const MainPage();
              },
            ),
          ),
          const NavBar(),
        ],
      ),
    );
  }
}
