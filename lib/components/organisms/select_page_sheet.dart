import 'package:flutter/material.dart';

class SelectPageSheet extends StatelessWidget {
  const SelectPageSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [Text('my pages')],
      ),
    );
  }
}
