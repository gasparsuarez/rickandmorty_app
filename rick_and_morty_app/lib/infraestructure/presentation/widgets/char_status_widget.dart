import 'package:flutter/material.dart';

class StatusWidget extends StatelessWidget {
  final Color color;
  final String status;
  const StatusWidget({super.key, required this.color, required this.status});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Estado:'),
        const SizedBox(width: 5),
        Container(
            width: 10, height: 10, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        const SizedBox(width: 5),
        Text(status),
      ],
    );
  }
}
