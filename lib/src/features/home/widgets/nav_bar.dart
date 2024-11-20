import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/config/fonts.dart';
import '../../../core/widgets/others/svg_widget.dart';
import '../../../core/widgets/buttons/my_button.dart';
import '../../../blocs/navbar/navbar_bloc.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          color: Color(0xff181818),
        ),
        child: BlocBuilder<NavbarBloc, NavbarState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _NavBarButton(
                  id: 1,
                  title: 'Home',
                  active: state is NavbarInitial,
                ),
                _NavBarButton(
                  id: 2,
                  title: 'Income',
                  active: state is NavbarIncome,
                ),
                _NavBarButton(
                  id: 3,
                  title: 'News',
                  active: state is NavbarNews,
                ),
                _NavBarButton(
                  id: 4,
                  title: 'Quiz',
                  active: state is NavbarQuiz,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _NavBarButton extends StatelessWidget {
  const _NavBarButton({
    required this.id,
    required this.title,
    required this.active,
  });

  final int id;
  final String title;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return MyButton(
      onPressed: active
          ? null
          : () {
              context.read<NavbarBloc>().add(ChangePageEvent(index: id));
            },
      padding: 0,
      child: SizedBox(
        width: 62,
        child: Column(
          children: [
            const SizedBox(height: 14),
            SizedBox(
              height: 25,
              child: SvgWidget(
                'assets/tab$id.svg',
                color: active ? const Color(0xffFEDB35) : Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(
                color: active ? const Color(0xffFEDB35) : Colors.white,
                fontSize: 10,
                fontFamily: Fonts.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
