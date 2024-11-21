import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/button/button_bloc.dart';
import '../../../core/models/news.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/tab_button.dart';
import '../../../core/widgets/texts/page_title.dart';
import '../widgets/news_card.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  String category = 'All';
  List<String> newsCategory = [
    'All',
    'Politics',
    'Finance',
    'Analytics',
    'Statistics',
  ];

  void onCategory(String value) {
    category = value;
    context.read<ButtonBloc>().add(CheckButtonActive(controllers: const ['']));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: getStatusBar(context, height: 6)),
        const PageTitle('News'),
        const SizedBox(height: 26),
        SizedBox(
          height: 36,
          child: BlocConsumer<ButtonBloc, ButtonState>(
            listener: (context, state) {
              logger(state.runtimeType);
            },
            builder: (context, state) {
              return ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 22),
                children: List.generate(
                  newsCategory.length,
                  (index) {
                    return TabButton(
                      title: newsCategory[index],
                      current: category,
                      onPressed: onCategory,
                    );
                  },
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 13),
        Expanded(
          child: BlocBuilder<ButtonBloc, ButtonState>(
            builder: (context, state) {
              return ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 20,
                ),
                itemCount: newsList.length,
                itemBuilder: (context, index) {
                  if (category == 'All') {
                    return NewsCard(news: newsList[index]);
                  } else if (newsList[index].category == category) {
                    return NewsCard(news: newsList[index]);
                  }
                  return const SizedBox();
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
