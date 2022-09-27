import 'package:client/utils/colors.dart';
import 'package:client/utils/constants.dart';
import 'package:flutter/material.dart';

class MagicalFloatingActionButton extends StatelessWidget {
  final VoidCallback onPress;

  const MagicalFloatingActionButton({Key? key, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Draggable(
        child: FloatingActionButton(
          onPressed: onPress,
          backgroundColor: Constants.PRIMARY_COLOR,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        feedback: Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(45),
              color: placeholderColor(context)),
        ));
  }
}
