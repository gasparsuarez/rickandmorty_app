import 'package:flutter/material.dart';

class CustomDataErrorWidget extends StatelessWidget {
  final String error;
  const CustomDataErrorWidget({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [const Icon(Icons.error_outline, size: 28, color: Colors.orange), Text(error)],
      ),
    );
  }
}
