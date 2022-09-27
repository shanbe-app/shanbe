import 'package:client/utils/constants.dart';
import 'package:flutter/material.dart';

class MagicalFloatingActionButton extends StatelessWidget {
  const MagicalFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: Constants.PRIMARY_COLOR,
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
