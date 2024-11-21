import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/button/button_bloc.dart';
import '../../../blocs/incom/incom_bloc.dart';
import '../../../core/config/fonts.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/tab_button.dart';
import '../../../core/widgets/others/no_data.dart';
import '../../../core/widgets/texts/page_title.dart';
import '../widgets/balance_card.dart';
import '../widgets/income_card.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  String page = 'Balance';
  List<String> pages = [
    'Balance',
    'Currency rate',
    'History',
  ];

  void onPage(String value) {
    setState(() {
      page = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: getStatusBar(context, height: 6)),
        const PageTitle('Income'),
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
                  pages.length,
                  (index) {
                    return TabButton(
                      title: pages[index],
                      current: page,
                      onPressed: onPage,
                    );
                  },
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        if (page == 'Balance')
          Column(
            children: [
              const SizedBox(height: 10),
              const BalanceCard(),
              const SizedBox(height: 16),
              const Row(
                children: [
                  SizedBox(width: 22),
                  Text(
                    'Actions',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontFamily: Fonts.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              BlocBuilder<IncomBloc, IncomState>(
                builder: (context, state) {
                  if (state is IncomLoadedState) {
                    return Column(
                      children: [
                        ...List.generate(
                          state.incoms.length,
                          (index) {
                            if (index < 2) {
                              return IncomeCard(incom: state.incoms[index]);
                            }
                            return Container();
                          },
                        ),
                      ],
                    );
                  }
                  return Container();
                },
              )
            ],
          )
        else if (page == 'History')
          Expanded(
            child: BlocBuilder<IncomBloc, IncomState>(
              builder: (context, state) {
                if (state is IncomLoadedState) {
                  if (state.incoms.isEmpty) {
                    return const NoData();
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    itemCount: state.incoms.length,
                    itemBuilder: (context, index) {
                      return IncomeCard(incom: state.incoms[index]);
                    },
                  );
                }

                return Container();
              },
            ),
          )
        else
          const Text('Exchange'),
      ],
    );
  }
}
