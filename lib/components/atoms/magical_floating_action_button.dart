import 'package:client/utils/constants.dart';
import 'package:flutter/material.dart';

class MagicalFloatingActionButton extends StatelessWidget {
  final Function onPress;

  const MagicalFloatingActionButton({Key? key, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPress,
      backgroundColor: Constants.PRIMARY_COLOR,
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
