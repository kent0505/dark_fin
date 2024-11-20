import 'package:dark_fin/src/core/widgets/others/no_data.dart';
import 'package:dark_fin/src/features/home/widgets/balance_card.dart';
import 'package:dark_fin/src/features/home/widgets/income_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/button/button_bloc.dart';
import '../../../blocs/incom/incom_bloc.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/tab_button.dart';
import '../../../core/widgets/texts/page_title.dart';

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
        const SizedBox(height: 20),
        if (page == 'Balance')
          const Column(
            children: [
              BalanceCard(),
            ],
          ),
        if (page == 'History')
          Expanded(
            child: BlocBuilder<IncomBloc, IncomState>(
              builder: (context, state) {
                if (state is IncomLoadedState) {
                  if (state.incoms.isEmpty) {
                    return const NoData();
                  }
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: state.incoms.length,
                    itemBuilder: (context, index) {
                      return IncomeCard(incom: state.incoms[index]);
                    },
                  );
                }

                return Container();
              },
            ),
          ),
      ],
    );
  }
}
