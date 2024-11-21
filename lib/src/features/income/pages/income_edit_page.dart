import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../blocs/button/button_bloc.dart';
import '../../../blocs/incom/incom_bloc.dart';
import '../../../core/models/incom.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/main_button.dart';
import '../../../core/widgets/buttons/pop_button.dart';
import '../../../core/widgets/buttons/tab_button.dart';
import '../../../core/widgets/dialogs/my_dialog.dart';
import '../../../core/widgets/textfields/txt_field.dart';
import '../../../core/widgets/texts/page_title.dart';

class IncomeEditPage extends StatefulWidget {
  const IncomeEditPage({
    super.key,
    required this.incom,
  });

  final Incom incom;

  @override
  State<IncomeEditPage> createState() => _IncomeEditPageState();
}

class _IncomeEditPageState extends State<IncomeEditPage> {
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
    if (categoryController.text == value) {
      categoryController.clear();
    } else {
      categoryController.text = value;
    }
    checkButton();
  }

  @override
  void initState() {
    super.initState();
    categoryController.text = widget.incom.category;
    titleController.text = widget.incom.title;
    amountController.text = widget.incom.amount.toString();
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
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: getStatusBar(context, height: 6)),
          Row(
            children: [
              const SizedBox(width: 22),
              PopButton(
                title: 'Back',
                onPressed: () {
                  context.pop();
                },
              ),
              const Spacer(),
              PopButton(
                title: 'Delete',
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return MyDialog(
                        title: 'Delete income?',
                        onYes: () {
                          context
                              .read<IncomBloc>()
                              .add(IncomDelete(incom: widget.incom));
                          context.read<ButtonBloc>().add(DisableButton());
                          context.pop();
                        },
                      );
                    },
                  );
                },
              ),
              const SizedBox(width: 22),
            ],
          ),
          const SizedBox(height: 26),
          SizedBox(
            height: 36,
            child: BlocBuilder<ButtonBloc, ButtonState>(
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
            title: 'Edit income',
            horizontalPadding: 16,
            onPressed: () {
              final incom = Incom(
                id: widget.incom.id,
                category: categoryController.text,
                title: titleController.text,
                amount: int.parse(amountController.text),
              );
              context.read<IncomBloc>().add(IncomEdit(incom: incom));
              context.read<ButtonBloc>().add(DisableButton());
              context.pop();
            },
          ),
        ],
      ),
    );
  }
}
