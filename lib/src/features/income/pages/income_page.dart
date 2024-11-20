import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/button/button_bloc.dart';
import '../../../blocs/incom/incom_bloc.dart';
import '../../../blocs/navbar/navbar_bloc.dart';
import '../../../core/models/incom.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/main_button.dart';
import '../../../core/widgets/buttons/tab_button.dart';
import '../../../core/widgets/textfields/txt_field.dart';
import '../../../core/widgets/texts/page_title.dart';

class IncomePage extends StatefulWidget {
  const IncomePage({super.key});

  @override
  State<IncomePage> createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {
  final categoryController = TextEditingController();
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  List<String> categories = [
    'Personal',
    'Real estate',
    'Dividends',
  ];

  void checkButton() {
    context.read<ButtonBloc>().add(
          CheckButtonActive(
            controllers: [
              categoryController.text,
              titleController.text,
              amountController.text,
            ],
          ),
        );
  }

  void onCategory(String value) {
    identical(categoryController.text, value)
        ? categoryController.clear()
        : categoryController.text = value;
    checkButton();
  }

  void onAdd() {
    final incom = Incom(
      id: getTimestamp(),
      category: categoryController.text,
      title: titleController.text,
      amount: int.parse(amountController.text),
    );
    context.read<IncomBloc>().add(AddIncomEvent(incom: incom));
    context.read<NavbarBloc>().add(ChangeNavbar(index: 1));
    context.read<ButtonBloc>().add(DisableButton());
  }

  @override
  void initState() {
    super.initState();
    checkButton();
  }

  @override
  void dispose() {
    categoryController.dispose();
    titleController.dispose();
    amountController.dispose();
    super.dispose();
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
                  categories.length,
                  (index) {
                    return TabButton(
                      title: categories[index],
                      current: categoryController.text,
                      onPressed: onCategory,
                    );
                  },
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 50),
        const PageTitle('Add Transaction'),
        const SizedBox(height: 16),
        TxtField(
          controller: titleController,
          hintText: 'Income description',
          horizontalPadding: 16,
          onChanged: checkButton,
        ),
        const SizedBox(height: 16),
        TxtField(
          controller: amountController,
          hintText: 'Income amount',
          onlyNumber: true,
          length: 7,
          horizontalPadding: 16,
          onChanged: checkButton,
        ),
        const SizedBox(height: 56),
        MainButton(
          title: 'Add income',
          horizontalPadding: 16,
          onPressed: onAdd,
        ),
      ],
    );
  }
}
