import 'package:flutter/material.dart';

class PaginatorBarWidget extends StatelessWidget {
  final int currentPage;
  final int maxPage;
  final int minPage;
  final VoidCallback buttonLeftFunction;
  final VoidCallback buttonRightFunction;

  const PaginatorBarWidget(
      {super.key,
      required this.currentPage,
      required this.maxPage,
      required this.minPage,
      required this.buttonLeftFunction,
      required this.buttonRightFunction});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 45),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: (currentPage == minPage) ? null : buttonLeftFunction,
            icon: Icon(
              Icons.keyboard_arrow_left_outlined,
              size: 30,
              color: (currentPage == minPage) ? Colors.grey : Colors.orange,
            ),
          ),
          Text(
            'Página $currentPage',
            style: const TextStyle(fontSize: 20),
          ),
          IconButton(
              onPressed: (currentPage == maxPage) ? null : buttonRightFunction,
              icon: Icon(Icons.keyboard_arrow_right_outlined,
                  size: 30, color: (currentPage == maxPage) ? Colors.grey : Colors.orange)),
        ],
      ),
    );
  }
}
